/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod_client/serverpod_client.dart' as _i1;
import '../protocol.dart' as _i2;

class Question extends _i1.SerializableEntity {
  Question({
    this.id,
    required this.text,
    required this.roomId,
    this.answers,
  });

  factory Question.fromJson(
    Map<String, dynamic> jsonSerialization,
    _i1.SerializationManager serializationManager,
  ) {
    return Question(
      id: serializationManager.deserialize<int?>(jsonSerialization['id']),
      text: serializationManager.deserialize<String>(jsonSerialization['text']),
      roomId:
          serializationManager.deserialize<int>(jsonSerialization['roomId']),
      answers: serializationManager
          .deserialize<List<_i2.Answer>?>(jsonSerialization['answers']),
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  String text;

  int roomId;

  List<_i2.Answer>? answers;

  @override
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'text': text,
      'roomId': roomId,
      'answers': answers,
    };
  }
}
