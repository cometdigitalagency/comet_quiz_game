/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod_client/serverpod_client.dart' as _i1;
import '../protocol.dart' as _i2;

class Room extends _i1.SerializableEntity {
  Room({
    this.id,
    required this.name,
    this.startDate,
    this.finishedDate,
    this.currentQuestion,
    this.questions,
  });

  factory Room.fromJson(
    Map<String, dynamic> jsonSerialization,
    _i1.SerializationManager serializationManager,
  ) {
    return Room(
      id: serializationManager.deserialize<int?>(jsonSerialization['id']),
      name: serializationManager.deserialize<String>(jsonSerialization['name']),
      startDate: serializationManager
          .deserialize<DateTime?>(jsonSerialization['startDate']),
      finishedDate: serializationManager
          .deserialize<DateTime?>(jsonSerialization['finishedDate']),
      currentQuestion: serializationManager
          .deserialize<int?>(jsonSerialization['currentQuestion']),
      questions: serializationManager
          .deserialize<List<_i2.Question>?>(jsonSerialization['questions']),
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  String name;

  DateTime? startDate;

  DateTime? finishedDate;

  int? currentQuestion;

  List<_i2.Question>? questions;

  @override
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'startDate': startDate,
      'finishedDate': finishedDate,
      'currentQuestion': currentQuestion,
      'questions': questions,
    };
  }
}
