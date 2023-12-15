import 'dart:async';
import 'package:comet_quiz_game_client/comet_quiz_game_client.dart';
import 'package:comet_quiz_game_flutter/constants/local_storage_key.dart';
import 'package:comet_quiz_game_flutter/main.dart';
import 'package:comet_quiz_game_flutter/pages/views/answer_view.dart';
import 'package:comet_quiz_game_flutter/pages/views/lobby_widget.dart';
import 'package:comet_quiz_game_flutter/pages/views/question_widget.dart';
import 'package:comet_quiz_game_flutter/pages/views/score_board_widget.dart';
import 'package:comet_quiz_game_flutter/pages/widgets/quiz_app_bar_widget.dart';
import 'package:comet_quiz_game_flutter/utils/app_alert.dart';
import 'package:comet_quiz_game_flutter/utils/local_storage.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MainPage extends StatefulWidget {
  final int roomId;
  const MainPage({super.key, required this.roomId});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  StreamingConnectionHandler? connectionHandler;
  StreamSubscription<SerializableEntity>? streamSubscription;

  StreamController<Participant>? participantStreamController;
  StreamController<Room>? startGameStreamController;
  StreamController<GameResponse>? gameTimerStreamController;
  StreamController<ListAnswerResponse>? answerResponseStreamController;

  Player? _currentPlayer;

  void _initializeControllers() {
    participantStreamController = StreamController.broadcast();
    startGameStreamController = StreamController.broadcast();
    gameTimerStreamController = StreamController.broadcast();
    answerResponseStreamController = StreamController.broadcast();
  }

  void _connectWebsocket() {
    // Setup our connection handler and open a streaming connection to the
    // server. The [StreamingConnectionHandler] will attempt to reconnect until
    // the `close` method is called.
    connectionHandler = StreamingConnectionHandler(
      client: client,
      listener: (connectionState) async {
        if (connectionState.status == StreamingConnectionStatus.connected) {
          final sharedPreferences = await SharedPreferences.getInstance();
          final userMap = LocalStorage(sharedPreferences: sharedPreferences)
              .getObject(LocalStorageKey.user.name);
          if (userMap != null) {
            final player =
                Player.fromJson(userMap, client.serializationManager);
            _currentPlayer = player;
            await client.main.sendStreamMessage(
                JoinRoomPayload(roomId: widget.roomId, player: player));
          }
        }
      },
    );

    connectionHandler?.connect();
  }

  void _startListeners() {
    client.main.resetStream();
    streamSubscription = client.main.stream.listen((event) {
      if (event is Participant) {
        if (event.roomId == widget.roomId) {
          participantStreamController?.sink.add(event);
        }
      } else if (event is Room) {
        if (event.id == widget.roomId) {
          startGameStreamController?.sink.add(event);
        }
      } else if (event is GameResponse) {
        if (event.roomId == widget.roomId) {
          gameTimerStreamController?.sink.add(event);
        }
      } else if (event is ListAnswerResponse) {
        if (event.roomId == widget.roomId) {
          answerResponseStreamController?.sink.add(event);
        }
      }
    });
  }

  void _disposeListeners() {
    participantStreamController?.close();
    startGameStreamController?.close();
    gameTimerStreamController?.close();
    answerResponseStreamController?.close();
    streamSubscription?.cancel();
    connectionHandler?.close();
    connectionHandler?.dispose();
  }

  @override
  void initState() {
    _disposeListeners();
    _initializeControllers();
    _startListeners();
    super.initState();
    _connectWebsocket();
  }

  @override
  void dispose() {
    _disposeListeners();
    super.dispose();
  }

  bool isLobby = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const QuizAppBar(),
      body: FutureBuilder(
        future: client.main.getQuestions(widget.roomId),
        builder: (context, roomSnapshot) {
          return StreamBuilder(
            stream: startGameStreamController?.stream,
            builder: (context, startSnapshot) {
              if (startSnapshot.data?.startDate == null) {
                return StreamBuilder<Participant>(
                    stream: participantStreamController?.stream,
                    builder: (context, participantSnapshot) {
                      return LobbyView(
                        roomName: roomSnapshot.data?.name ?? '',
                        players: participantSnapshot.data?.participants ?? [],
                        onPressed: () async {
                          final room = roomSnapshot.data;
                          if (room != null) {
                            await client.main.sendStreamMessage(
                                StartGamePayload(room: room));
                          } else {
                            AppAlert.showAppToast("Cannot find room!");
                          }
                        },
                      );
                    });
              } else if (roomSnapshot.data?.finishedDate != null) {
                return FutureBuilder<List<PlayerScore>>(
                  future: client.main.getAllResults(widget.roomId),
                  builder: (context, snapshot) {
                    return ScoreBoardView(players: snapshot.data ?? []);
                  },
                );
              } else {
                return StreamBuilder(
                  stream: gameTimerStreamController?.stream,
                  builder: (context, snapshot) {
                    final data = snapshot.data;
                    if (snapshot.hasData && data != null) {
                      if (data.status == GameStatus.question) {
                        return QuestionView(
                            label: "question ${data.question?.id}",
                            question: data.question?.text ?? "",
                            closeIn: data.time);
                      } else if (data.status == GameStatus.waiting ||
                          data.status == GameStatus.answer) {
                        return StreamBuilder<ListAnswerResponse>(
                            stream: answerResponseStreamController?.stream,
                            builder: (context, answerRespnoseSnapshot) {
                              return AnswerView(
                                amountPlayer: data.participants,
                                questionLabel: "Question ${data.question?.id}",
                                listAnswerResponse: answerRespnoseSnapshot.data,
                                question: data.question!,
                                closeIn: data.time,
                                showAnswer: data.status == GameStatus.answer,
                                onAnswer: (answer) async {
                                  await client.main.sendStreamMessage(
                                    AnswerPayload(
                                      answerId: answer.id!,
                                      roomId: widget.roomId,
                                      questionId: data.question!.id!,
                                      playerId: _currentPlayer!.id!,
                                      selectedAt: data.time,
                                    ),
                                  );
                                },
                              );
                            });
                      } else if (data.status == GameStatus.finish) {
                        return FutureBuilder<List<PlayerScore>>(
                          future: client.main.getAllResults(widget.roomId),
                          builder: (context, snapshot) {
                            return ScoreBoardView(players: snapshot.data ?? []);
                          },
                        );
                      }
                    }
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  },
                );
              }
            },
          );
        },
      ),
    );
  }
}
