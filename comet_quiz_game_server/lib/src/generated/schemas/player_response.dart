/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod/serverpod.dart' as _i1;

class PlayerResponse extends _i1.TableRow {
  PlayerResponse({
    int? id,
    required this.userId,
    required this.roomId,
    required this.questionId,
    required this.selectedAnswerId,
    required this.selectedAt,
    this.isCorrectOption,
    this.user,
  }) : super(id);

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

  static final t = PlayerResponseTable();

  int userId;

  int roomId;

  int questionId;

  int selectedAnswerId;

  int selectedAt;

  bool? isCorrectOption;

  String? user;

  @override
  String get tableName => 'player_response';

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

  @override
  Map<String, dynamic> toJsonForDatabase() {
    return {
      'id': id,
      'userId': userId,
      'roomId': roomId,
      'questionId': questionId,
      'selectedAnswerId': selectedAnswerId,
      'selectedAt': selectedAt,
    };
  }

  @override
  Map<String, dynamic> allToJson() {
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

  @override
  void setColumn(
    String columnName,
    value,
  ) {
    switch (columnName) {
      case 'id':
        id = value;
        return;
      case 'userId':
        userId = value;
        return;
      case 'roomId':
        roomId = value;
        return;
      case 'questionId':
        questionId = value;
        return;
      case 'selectedAnswerId':
        selectedAnswerId = value;
        return;
      case 'selectedAt':
        selectedAt = value;
        return;
      default:
        throw UnimplementedError();
    }
  }

  static Future<List<PlayerResponse>> find(
    _i1.Session session, {
    PlayerResponseExpressionBuilder? where,
    int? limit,
    int? offset,
    _i1.Column? orderBy,
    List<_i1.Order>? orderByList,
    bool orderDescending = false,
    bool useCache = true,
    _i1.Transaction? transaction,
  }) async {
    return session.db.find<PlayerResponse>(
      where: where != null ? where(PlayerResponse.t) : null,
      limit: limit,
      offset: offset,
      orderBy: orderBy,
      orderByList: orderByList,
      orderDescending: orderDescending,
      useCache: useCache,
      transaction: transaction,
    );
  }

  static Future<PlayerResponse?> findSingleRow(
    _i1.Session session, {
    PlayerResponseExpressionBuilder? where,
    int? offset,
    _i1.Column? orderBy,
    bool orderDescending = false,
    bool useCache = true,
    _i1.Transaction? transaction,
  }) async {
    return session.db.findSingleRow<PlayerResponse>(
      where: where != null ? where(PlayerResponse.t) : null,
      offset: offset,
      orderBy: orderBy,
      orderDescending: orderDescending,
      useCache: useCache,
      transaction: transaction,
    );
  }

  static Future<PlayerResponse?> findById(
    _i1.Session session,
    int id,
  ) async {
    return session.db.findById<PlayerResponse>(id);
  }

  static Future<int> delete(
    _i1.Session session, {
    required PlayerResponseExpressionBuilder where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<PlayerResponse>(
      where: where(PlayerResponse.t),
      transaction: transaction,
    );
  }

  static Future<bool> deleteRow(
    _i1.Session session,
    PlayerResponse row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow(
      row,
      transaction: transaction,
    );
  }

  static Future<bool> update(
    _i1.Session session,
    PlayerResponse row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.update(
      row,
      transaction: transaction,
    );
  }

  static Future<void> insert(
    _i1.Session session,
    PlayerResponse row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert(
      row,
      transaction: transaction,
    );
  }

  static Future<int> count(
    _i1.Session session, {
    PlayerResponseExpressionBuilder? where,
    int? limit,
    bool useCache = true,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<PlayerResponse>(
      where: where != null ? where(PlayerResponse.t) : null,
      limit: limit,
      useCache: useCache,
      transaction: transaction,
    );
  }
}

typedef PlayerResponseExpressionBuilder = _i1.Expression Function(
    PlayerResponseTable);

class PlayerResponseTable extends _i1.Table {
  PlayerResponseTable() : super(tableName: 'player_response');

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  final id = _i1.ColumnInt('id');

  final userId = _i1.ColumnInt('userId');

  final roomId = _i1.ColumnInt('roomId');

  final questionId = _i1.ColumnInt('questionId');

  final selectedAnswerId = _i1.ColumnInt('selectedAnswerId');

  final selectedAt = _i1.ColumnInt('selectedAt');

  @override
  List<_i1.Column> get columns => [
        id,
        userId,
        roomId,
        questionId,
        selectedAnswerId,
        selectedAt,
      ];
}

@Deprecated('Use PlayerResponseTable.t instead.')
PlayerResponseTable tPlayerResponse = PlayerResponseTable();
