import 'package:comet_quiz_game_server/src/generated/protocol.dart';
import 'package:serverpod/serverpod.dart';

class RegisterEndpoint extends Endpoint {
  static const String questionIdNotFound =
      "Cannot find the question, please try again...";

  Future<Question> createQuestion(
      Session session, Question question, List<Answer> answers) async {
    try {
      return await session.db.transaction((transaction) async {
        try {
          await Question.insert(session, question, transaction: transaction);
          final questionId = question.id;
          if (questionId != null) {
            question.answers = [];
            for (Answer answer in answers) {
              await Answer.insert(session, answer..questionId = questionId,
                  transaction: transaction);
              question.answers?.add(answer);
            }
            return question;
          } else {
            throw AppException(message: questionIdNotFound);
          }
        } on AppException {
          transaction.postgresContext.cancelTransaction();
          rethrow;
        } catch (e) {
          transaction.postgresContext.cancelTransaction();
          throw AppException(message: e.toString());
        }
      });
    } catch (e) {
      throw AppException(message: e.toString());
    }
  }

  Future<Room> createRoom(Session session, Room room) async {
    try {
      await Room.insert(session, room);
      return room;
    } catch (e) {
      throw AppException(message: e.toString());
    }
  }
}
