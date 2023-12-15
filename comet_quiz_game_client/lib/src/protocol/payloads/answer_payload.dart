/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod_client/serverpod_client.dart' as _i1;

class AnswerPayload extends _i1.SerializableEntity {
  AnswerPayload({
    required this.answerId,
    required this.roomId,
    required this.questionId,
    required this.playerId,
    required this.selectedAt,
  });

  factory AnswerPayload.fromJson(
    Map<String, dynamic> jsonSerialization,
    _i1.SerializationManager serializationManager,
  ) {
    return AnswerPayload(
      answerId:
          serializationManager.deserialize<int>(jsonSerialization['answerId']),
      roomId:
          serializationManager.deserialize<int>(jsonSerialization['roomId']),
      questionId: serializationManager
          .deserialize<int>(jsonSerialization['questionId']),
      playerId:
          serializationManager.deserialize<int>(jsonSerialization['playerId']),
      selectedAt: serializationManager
          .deserialize<int>(jsonSerialization['selectedAt']),
    );
  }

  int answerId;

  int roomId;

  int questionId;

  int playerId;

  int selectedAt;

  @override
  Map<String, dynamic> toJson() {
    return {
      'answerId': answerId,
      'roomId': roomId,
      'questionId': questionId,
      'playerId': playerId,
      'selectedAt': selectedAt,
    };
  }
}
