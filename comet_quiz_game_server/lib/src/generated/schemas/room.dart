/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod/serverpod.dart' as _i1;
import '../protocol.dart' as _i2;

class Room extends _i1.TableRow {
  Room({
    int? id,
    required this.name,
    this.startDate,
    this.finishedDate,
    this.currentQuestion,
    this.questions,
  }) : super(id);

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

  static final t = RoomTable();

  String name;

  DateTime? startDate;

  DateTime? finishedDate;

  int? currentQuestion;

  List<_i2.Question>? questions;

  @override
  String get tableName => 'room';

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

  @override
  Map<String, dynamic> toJsonForDatabase() {
    return {
      'id': id,
      'name': name,
      'startDate': startDate,
      'finishedDate': finishedDate,
    };
  }

  @override
  Map<String, dynamic> allToJson() {
    return {
      'id': id,
      'name': name,
      'startDate': startDate,
      'finishedDate': finishedDate,
      'currentQuestion': currentQuestion,
      'questions': questions,
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
      case 'name':
        name = value;
        return;
      case 'startDate':
        startDate = value;
        return;
      case 'finishedDate':
        finishedDate = value;
        return;
      default:
        throw UnimplementedError();
    }
  }

  static Future<List<Room>> find(
    _i1.Session session, {
    RoomExpressionBuilder? where,
    int? limit,
    int? offset,
    _i1.Column? orderBy,
    List<_i1.Order>? orderByList,
    bool orderDescending = false,
    bool useCache = true,
    _i1.Transaction? transaction,
  }) async {
    return session.db.find<Room>(
      where: where != null ? where(Room.t) : null,
      limit: limit,
      offset: offset,
      orderBy: orderBy,
      orderByList: orderByList,
      orderDescending: orderDescending,
      useCache: useCache,
      transaction: transaction,
    );
  }

  static Future<Room?> findSingleRow(
    _i1.Session session, {
    RoomExpressionBuilder? where,
    int? offset,
    _i1.Column? orderBy,
    bool orderDescending = false,
    bool useCache = true,
    _i1.Transaction? transaction,
  }) async {
    return session.db.findSingleRow<Room>(
      where: where != null ? where(Room.t) : null,
      offset: offset,
      orderBy: orderBy,
      orderDescending: orderDescending,
      useCache: useCache,
      transaction: transaction,
    );
  }

  static Future<Room?> findById(
    _i1.Session session,
    int id,
  ) async {
    return session.db.findById<Room>(id);
  }

  static Future<int> delete(
    _i1.Session session, {
    required RoomExpressionBuilder where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<Room>(
      where: where(Room.t),
      transaction: transaction,
    );
  }

  static Future<bool> deleteRow(
    _i1.Session session,
    Room row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow(
      row,
      transaction: transaction,
    );
  }

  static Future<bool> update(
    _i1.Session session,
    Room row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.update(
      row,
      transaction: transaction,
    );
  }

  static Future<void> insert(
    _i1.Session session,
    Room row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert(
      row,
      transaction: transaction,
    );
  }

  static Future<int> count(
    _i1.Session session, {
    RoomExpressionBuilder? where,
    int? limit,
    bool useCache = true,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<Room>(
      where: where != null ? where(Room.t) : null,
      limit: limit,
      useCache: useCache,
      transaction: transaction,
    );
  }
}

typedef RoomExpressionBuilder = _i1.Expression Function(RoomTable);

class RoomTable extends _i1.Table {
  RoomTable() : super(tableName: 'room');

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  final id = _i1.ColumnInt('id');

  final name = _i1.ColumnString('name');

  final startDate = _i1.ColumnDateTime('startDate');

  final finishedDate = _i1.ColumnDateTime('finishedDate');

  @override
  List<_i1.Column> get columns => [
        id,
        name,
        startDate,
        finishedDate,
      ];
}

@Deprecated('Use RoomTable.t instead.')
RoomTable tRoom = RoomTable();
