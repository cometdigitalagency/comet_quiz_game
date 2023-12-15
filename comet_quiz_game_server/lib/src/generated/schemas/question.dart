/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod/serverpod.dart' as _i1;
import '../protocol.dart' as _i2;

class Question extends _i1.TableRow {
  Question({
    int? id,
    required this.text,
    required this.roomId,
    this.answers,
  }) : super(id);

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

  static final t = QuestionTable();

  String text;

  int roomId;

  List<_i2.Answer>? answers;

  @override
  String get tableName => 'question';

  @override
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'text': text,
      'roomId': roomId,
      'answers': answers,
    };
  }

  @override
  Map<String, dynamic> toJsonForDatabase() {
    return {
      'id': id,
      'text': text,
      'roomId': roomId,
    };
  }

  @override
  Map<String, dynamic> allToJson() {
    return {
      'id': id,
      'text': text,
      'roomId': roomId,
      'answers': answers,
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
      case 'text':
        text = value;
        return;
      case 'roomId':
        roomId = value;
        return;
      default:
        throw UnimplementedError();
    }
  }

  static Future<List<Question>> find(
    _i1.Session session, {
    QuestionExpressionBuilder? where,
    int? limit,
    int? offset,
    _i1.Column? orderBy,
    List<_i1.Order>? orderByList,
    bool orderDescending = false,
    bool useCache = true,
    _i1.Transaction? transaction,
  }) async {
    return session.db.find<Question>(
      where: where != null ? where(Question.t) : null,
      limit: limit,
      offset: offset,
      orderBy: orderBy,
      orderByList: orderByList,
      orderDescending: orderDescending,
      useCache: useCache,
      transaction: transaction,
    );
  }

  static Future<Question?> findSingleRow(
    _i1.Session session, {
    QuestionExpressionBuilder? where,
    int? offset,
    _i1.Column? orderBy,
    bool orderDescending = false,
    bool useCache = true,
    _i1.Transaction? transaction,
  }) async {
    return session.db.findSingleRow<Question>(
      where: where != null ? where(Question.t) : null,
      offset: offset,
      orderBy: orderBy,
      orderDescending: orderDescending,
      useCache: useCache,
      transaction: transaction,
    );
  }

  static Future<Question?> findById(
    _i1.Session session,
    int id,
  ) async {
    return session.db.findById<Question>(id);
  }

  static Future<int> delete(
    _i1.Session session, {
    required QuestionExpressionBuilder where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<Question>(
      where: where(Question.t),
      transaction: transaction,
    );
  }

  static Future<bool> deleteRow(
    _i1.Session session,
    Question row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow(
      row,
      transaction: transaction,
    );
  }

  static Future<bool> update(
    _i1.Session session,
    Question row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.update(
      row,
      transaction: transaction,
    );
  }

  static Future<void> insert(
    _i1.Session session,
    Question row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert(
      row,
      transaction: transaction,
    );
  }

  static Future<int> count(
    _i1.Session session, {
    QuestionExpressionBuilder? where,
    int? limit,
    bool useCache = true,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<Question>(
      where: where != null ? where(Question.t) : null,
      limit: limit,
      useCache: useCache,
      transaction: transaction,
    );
  }
}

typedef QuestionExpressionBuilder = _i1.Expression Function(QuestionTable);

class QuestionTable extends _i1.Table {
  QuestionTable() : super(tableName: 'question');

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  final id = _i1.ColumnInt('id');

  final text = _i1.ColumnString('text');

  final roomId = _i1.ColumnInt('roomId');

  @override
  List<_i1.Column> get columns => [
        id,
        text,
        roomId,
      ];
}

@Deprecated('Use QuestionTable.t instead.')
QuestionTable tQuestion = QuestionTable();
