/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod/serverpod.dart' as _i1;

class Answer extends _i1.TableRow {
  Answer({
    int? id,
    this.questionId,
    required this.text,
    required this.isCorrectOption,
  }) : super(id);

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

  static final t = AnswerTable();

  int? questionId;

  String text;

  bool isCorrectOption;

  @override
  String get tableName => 'answer';

  @override
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'questionId': questionId,
      'text': text,
      'isCorrectOption': isCorrectOption,
    };
  }

  @override
  Map<String, dynamic> toJsonForDatabase() {
    return {
      'id': id,
      'questionId': questionId,
      'text': text,
      'isCorrectOption': isCorrectOption,
    };
  }

  @override
  Map<String, dynamic> allToJson() {
    return {
      'id': id,
      'questionId': questionId,
      'text': text,
      'isCorrectOption': isCorrectOption,
    };
  }

  @override
  void setColumn(
    String columnName,
    value,
  ) {
    switch (columnName) {
      case 'id':
        id = value;
        return;
      case 'questionId':
        questionId = value;
        return;
      case 'text':
        text = value;
        return;
      case 'isCorrectOption':
        isCorrectOption = value;
        return;
      default:
        throw UnimplementedError();
    }
  }

  static Future<List<Answer>> find(
    _i1.Session session, {
    AnswerExpressionBuilder? where,
    int? limit,
    int? offset,
    _i1.Column? orderBy,
    List<_i1.Order>? orderByList,
    bool orderDescending = false,
    bool useCache = true,
    _i1.Transaction? transaction,
  }) async {
    return session.db.find<Answer>(
      where: where != null ? where(Answer.t) : null,
      limit: limit,
      offset: offset,
      orderBy: orderBy,
      orderByList: orderByList,
      orderDescending: orderDescending,
      useCache: useCache,
      transaction: transaction,
    );
  }

  static Future<Answer?> findSingleRow(
    _i1.Session session, {
    AnswerExpressionBuilder? where,
    int? offset,
    _i1.Column? orderBy,
    bool orderDescending = false,
    bool useCache = true,
    _i1.Transaction? transaction,
  }) async {
    return session.db.findSingleRow<Answer>(
      where: where != null ? where(Answer.t) : null,
      offset: offset,
      orderBy: orderBy,
      orderDescending: orderDescending,
      useCache: useCache,
      transaction: transaction,
    );
  }

  static Future<Answer?> findById(
    _i1.Session session,
    int id,
  ) async {
    return session.db.findById<Answer>(id);
  }

  static Future<int> delete(
    _i1.Session session, {
    required AnswerExpressionBuilder where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<Answer>(
      where: where(Answer.t),
      transaction: transaction,
    );
  }

  static Future<bool> deleteRow(
    _i1.Session session,
    Answer row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow(
      row,
      transaction: transaction,
    );
  }

  static Future<bool> update(
    _i1.Session session,
    Answer row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.update(
      row,
      transaction: transaction,
    );
  }

  static Future<void> insert(
    _i1.Session session,
    Answer row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert(
      row,
      transaction: transaction,
    );
  }

  static Future<int> count(
    _i1.Session session, {
    AnswerExpressionBuilder? where,
    int? limit,
    bool useCache = true,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<Answer>(
      where: where != null ? where(Answer.t) : null,
      limit: limit,
      useCache: useCache,
      transaction: transaction,
    );
  }
}

typedef AnswerExpressionBuilder = _i1.Expression Function(AnswerTable);

class AnswerTable extends _i1.Table {
  AnswerTable() : super(tableName: 'answer');

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  final id = _i1.ColumnInt('id');

  final questionId = _i1.ColumnInt('questionId');

  final text = _i1.ColumnString('text');

  final isCorrectOption = _i1.ColumnBool('isCorrectOption');

  @override
  List<_i1.Column> get columns => [
        id,
        questionId,
        text,
        isCorrectOption,
      ];
}

@Deprecated('Use AnswerTable.t instead.')
AnswerTable tAnswer = AnswerTable();
