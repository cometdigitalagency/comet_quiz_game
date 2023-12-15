import 'dart:async';

import 'package:comet_quiz_game_server/src/endpoints/register_endpoint.dart';
import 'package:comet_quiz_game_server/src/generated/protocol.dart';
import 'package:serverpod/serverpod.dart';

class MainEndpoint extends Endpoint {
  static const String _channel = "comet-channel";
  static const String questionIdNotFound =
      "Cannot find the question, please try again...";

  static const String userExistError =
      "The username already exist, please try another username";

  Future<Player> createPlayer(Session session, String username) async {
    try {
      final userExist = await Player.find(
        session,
        where: (table) {
          return table.username.equals(username);
        },
      );
      if (userExist.isNotEmpty) {
        throw AppException(message: userExistError);
      }
      final user = Player(username: username);
      await Player.insert(session, user);
      session.messages.postMessage(_channel, user, global: false);
      return user;
    } on AppException {
      rethrow;
    } catch (e) {
      throw AppException(message: e.toString());
    }
  }

  Future<Room> getQuestions(Session session, int roomId) async {
    try {
      final room = await Room.findById(session, roomId);
      if (room == null) {
        throw AppException(message: RegisterEndpoint.questionIdNotFound);
      }
      final questions = await Question.find(
        session,
        where: (table) {
          return table.roomId.equals(roomId);
        },
      );
      for (Question question in questions) {
        question.answers = await Answer.find(
          session,
          where: (p0) {
            return p0.questionId.equals(question.id);
          },
        );
      }
      room.questions = questions;
      session.messages.postMessage(_channel, room);
      return room;
    } on AppException {
      rethrow;
    } catch (e) {
      throw AppException(message: e.toString());
    }
  }

  Future<List<PlayerScore>> getAllResults(Session session, int roomId) async {
    try {
      final result = await PlayerResponse.find(
        session,
        where: (t) {
          return t.roomId.equals(roomId);
        },
      );
      Map<String, int> sumPlayersScore = {};
      for (PlayerResponse playerResponse in result) {
        await _updatePlayerResponseInfo(session, playerResponse);
        _convertPlayerResponseToUserScore(playerResponse, sumPlayersScore);
      }
      return sumPlayersScore.entries
          .map((e) => PlayerScore(score: e.value, username: e.key))
          .toList();
    } catch (e) {
      throw AppException(message: e.toString());
    }
  }

  Future<void> _updatePlayerResponseInfo(
      Session session, PlayerResponse playerResponse) async {
    final user = await Player.findById(session, playerResponse.userId);
    final option =
        await Answer.findById(session, playerResponse.selectedAnswerId);
    playerResponse.user = user?.username;
    playerResponse.isCorrectOption = option?.isCorrectOption;
  }

  void _convertPlayerResponseToUserScore(
      PlayerResponse playerResponse, Map<String, int> sumPlayersScore) {
    final username = playerResponse.user;
    final score = playerResponse.isCorrectOption == true ? 1 : 0;
    if (username != null) {
      if (sumPlayersScore.containsKey(username)) {
        sumPlayersScore[username] = (sumPlayersScore[username] ?? 0) + score;
      } else {
        sumPlayersScore[username] = score;
      }
    }
  }

  Future<Answer?> _submitAnswer(Session session, int roomId, int? questionId,
      int userId, int answerId, int selectedAt) async {
    try {
      if (questionId == null) {
        throw AppException(message: questionIdNotFound);
      }
      await PlayerResponse.insert(
          session,
          PlayerResponse(
              userId: userId,
              roomId: roomId,
              questionId: questionId,
              selectedAnswerId: answerId,
              selectedAt: selectedAt));
      return await Answer.findById(session, answerId);
    } on AppException {
      rethrow;
    } catch (e) {
      throw AppException(message: e.toString());
    }
  }

  Future<void> _countDown(Session session, GameResponse gameResponse,
      int duration, int nextDuration, GameStatus status,
      {Participant? participant}) async {
    for (var i = 0; i <= duration; i++) {
      session.messages.postMessage(_channel, gameResponse);
      await Future.delayed(Duration(seconds: 1));
      gameResponse.time -= 1;
      if (gameResponse.status == GameStatus.waiting) {
        final answersKey =
            "room-${gameResponse.roomId}-question-${gameResponse.question?.id}";
        ListAnswerResponse? listAnswerResponse =
            await session.caches.local.get<ListAnswerResponse>(answersKey);
        final answerAmount = listAnswerResponse?.answers
            .map((e) => e.amount)
            .reduce((value, element) => value + element);
        if (participant != null &&
            answerAmount == participant.participants.length) {
          gameResponse.status = status;
          gameResponse.time = nextDuration;
          break;
        }
      }
      if (gameResponse.time == 0) {
        gameResponse.status = status;
        gameResponse.time = nextDuration;
        break;
      }
    }
  }

  void _startGame(Session session, StartGamePayload message) async {
    final questions = message.room.questions;
    if (questions != null) {
      final roomId = message.room.id!;
      final key = "room-${message.room.id}";
      Participant? data = await session.caches.local.get<Participant>(key);
      for (Question question in questions) {
        GameResponse gameResponse = GameResponse(
            status: GameStatus.question,
            time: 5,
            question: question,
            participants: data?.participants.length ?? 0,
            roomId: roomId);
        gameResponse.question = question;
        if (gameResponse.status == GameStatus.question) {
          await _countDown(
            session,
            gameResponse,
            5,
            15,
            GameStatus.waiting,
          );
        }

        if (gameResponse.status == GameStatus.waiting) {
          await _countDown(
            session,
            gameResponse,
            15,
            3,
            GameStatus.answer,
            participant: data,
          );
        }

        if (gameResponse.status == GameStatus.answer) {
          await _countDown(
            session,
            gameResponse,
            3,
            5,
            GameStatus.question,
          );
        }
      }
      session.messages.postMessage(
        _channel,
        GameResponse(
          status: GameStatus.finish,
          time: 0,
          participants: 0,
          roomId: roomId,
        ),
      );
      await Room.update(session, message.room..finishedDate = DateTime.now());
    }
  }

  Future<void> _onPlayerJoined(
      StreamingSession session, JoinRoomPayload message) async {
    final key = "room-${message.roomId}";
    final local = session.caches.local;
    Participant? data = await local.get<Participant>(key);
    if (data != null) {
      data.participants
          .removeWhere((element) => element.id == message.player.id);
      data.participants.add(message.player);
    } else {
      data =
          Participant(participants: [message.player], roomId: message.roomId);
    }
    await local.put(key, data, lifetime: Duration(minutes: 10));
    session.messages.postMessage(_channel, data, global: false);
  }

  Future<void> _onStartGame(
      StreamingSession session, StartGamePayload message) async {
    if (message.room.startDate != null) return;
    await Room.update(session, message.room..startDate = DateTime.now());
    session.messages.postMessage(_channel, message.room, global: false);
    _startGame(session, message);
  }

  Future<void> _onAnswer(
      StreamingSession session, AnswerPayload message) async {
    await _submitAnswer(session, message.roomId, message.questionId,
        message.playerId, message.answerId, message.selectedAt);
    final answersKey = "room-${message.roomId}-question-${message.questionId}";
    final local = session.caches.local;
    ListAnswerResponse? listAnswerResponse =
        await local.get<ListAnswerResponse>(answersKey);
    if (listAnswerResponse != null) {
      if (listAnswerResponse.answers
          .where((element) => element.answerId == message.answerId)
          .isEmpty) {
        listAnswerResponse.answers.add(AnswerResponse(
            answerId: message.answerId, roomId: message.roomId, amount: 1));
      } else {
        for (var answer in listAnswerResponse.answers) {
          if (answer.answerId == message.answerId) {
            answer.amount += 1;
          }
        }
      }
    } else {
      listAnswerResponse = ListAnswerResponse(
        answers: [
          AnswerResponse(
            answerId: message.answerId,
            roomId: message.roomId,
            amount: 1,
          )
        ],
        roomId: message.roomId,
      );
    }

    await local.put(answersKey, listAnswerResponse,
        lifetime: Duration(minutes: 1));
    session.messages.postMessage(_channel, listAnswerResponse);
  }

  @override
  Future<void> streamOpened(StreamingSession session) async {
    session.messages.addListener(_channel, (message) {
      sendStreamMessage(session, message);
    });
  }

  @override
  Future<void> streamClosed(StreamingSession session) async {
    session.messages.removeListener(_channel, (message) {});
  }

  @override
  Future<void> handleStreamMessage(
      StreamingSession session, SerializableEntity message) async {
    if (message is JoinRoomPayload) {
      await _onPlayerJoined(session, message);
    } else if (message is StartGamePayload) {
      await _onStartGame(session, message);
    } else if (message is AnswerPayload) {
      await _onAnswer(session, message);
    }
  }
}
