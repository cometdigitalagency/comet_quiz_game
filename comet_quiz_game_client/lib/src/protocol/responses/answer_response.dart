/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod_client/serverpod_client.dart' as _i1;

class AnswerResponse extends _i1.SerializableEntity {
  AnswerResponse({
    required this.answerId,
    required this.roomId,
    required this.amount,
  });

  factory AnswerResponse.fromJson(
    Map<String, dynamic> jsonSerialization,
    _i1.SerializationManager serializationManager,
  ) {
    return AnswerResponse(
      answerId:
          serializationManager.deserialize<int>(jsonSerialization['answerId']),
      roomId:
          serializationManager.deserialize<int>(jsonSerialization['roomId']),
      amount:
          serializationManager.deserialize<double>(jsonSerialization['amount']),
    );
  }

  int answerId;

  int roomId;

  double amount;

  @override
  Map<String, dynamic> toJson() {
    return {
      'answerId': answerId,
      'roomId': roomId,
      'amount': amount,
    };
  }
}
