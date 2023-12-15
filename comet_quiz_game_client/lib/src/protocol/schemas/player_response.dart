/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod_client/serverpod_client.dart' as _i1;

class PlayerResponse extends _i1.SerializableEntity {
  PlayerResponse({
    this.id,
    required this.userId,
    required this.roomId,
    required this.questionId,
    required this.selectedAnswerId,
    required this.selectedAt,
    this.isCorrectOption,
    this.user,
  });

  factory PlayerResponse.fromJson(
    Map<String, dynamic> jsonSerialization,
    _i1.SerializationManager serializationManager,
  ) {
    return PlayerResponse(
      id: serializationManager.deserialize<int?>(jsonSerialization['id']),
      userId:
          serializationManager.deserialize<int>(jsonSerialization['userId']),
      roomId:
          serializationManager.deserialize<int>(jsonSerialization['roomId']),
      questionId: serializationManager
          .deserialize<int>(jsonSerialization['questionId']),
      selectedAnswerId: serializationManager
          .deserialize<int>(jsonSerialization['selectedAnswerId']),
      selectedAt: serializationManager
          .deserialize<int>(jsonSerialization['selectedAt']),
      isCorrectOption: serializationManager
          .deserialize<bool?>(jsonSerialization['isCorrectOption']),
      user:
          serializationManager.deserialize<String?>(jsonSerialization['user']),
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  int userId;

  int roomId;

  int questionId;

  int selectedAnswerId;

  int selectedAt;

  bool? isCorrectOption;

  String? user;

  @override
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'userId': userId,
      'roomId': roomId,
      'questionId': questionId,
      'selectedAnswerId': selectedAnswerId,
      'selectedAt': selectedAt,
      'isCorrectOption': isCorrectOption,
      'user': user,
    };
  }
}
