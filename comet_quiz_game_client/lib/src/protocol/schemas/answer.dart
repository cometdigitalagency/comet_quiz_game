/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod_client/serverpod_client.dart' as _i1;

class Answer extends _i1.SerializableEntity {
  Answer({
    this.id,
    this.questionId,
    required this.text,
    required this.isCorrectOption,
  });

  factory Answer.fromJson(
    Map<String, dynamic> jsonSerialization,
    _i1.SerializationManager serializationManager,
  ) {
    return Answer(
      id: serializationManager.deserialize<int?>(jsonSerialization['id']),
      questionId: serializationManager
          .deserialize<int?>(jsonSerialization['questionId']),
      text: serializationManager.deserialize<String>(jsonSerialization['text']),
      isCorrectOption: serializationManager
          .deserialize<bool>(jsonSerialization['isCorrectOption']),
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  int? questionId;

  String text;

  bool isCorrectOption;

  @override
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'questionId': questionId,
      'text': text,
      'isCorrectOption': isCorrectOption,
    };
  }
}
