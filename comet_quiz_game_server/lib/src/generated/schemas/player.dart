/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod/serverpod.dart' as _i1;

class Player extends _i1.TableRow {
  Player({
    int? id,
    required this.username,
  }) : super(id);

  factory Player.fromJson(
    Map<String, dynamic> jsonSerialization,
    _i1.SerializationManager serializationManager,
  ) {
    return Player(
      id: serializationManager.deserialize<int?>(jsonSerialization['id']),
      username: serializationManager
          .deserialize<String>(jsonSerialization['username']),
    );
  }

  static final t = PlayerTable();

  String username;

  @override
  String get tableName => 'player';

  @override
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'username': username,
    };
  }

  @override
  Map<String, dynamic> toJsonForDatabase() {
    return {
      'id': id,
      'username': username,
    };
  }

  @override
  Map<String, dynamic> allToJson() {
    return {
      'id': id,
      'username': username,
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
      case 'username':
        username = value;
        return;
      default:
        throw UnimplementedError();
    }
  }

  static Future<List<Player>> find(
    _i1.Session session, {
    PlayerExpressionBuilder? where,
    int? limit,
    int? offset,
    _i1.Column? orderBy,
    List<_i1.Order>? orderByList,
    bool orderDescending = false,
    bool useCache = true,
    _i1.Transaction? transaction,
  }) async {
    return session.db.find<Player>(
      where: where != null ? where(Player.t) : null,
      limit: limit,
      offset: offset,
      orderBy: orderBy,
      orderByList: orderByList,
      orderDescending: orderDescending,
      useCache: useCache,
      transaction: transaction,
    );
  }

  static Future<Player?> findSingleRow(
    _i1.Session session, {
    PlayerExpressionBuilder? where,
    int? offset,
    _i1.Column? orderBy,
    bool orderDescending = false,
    bool useCache = true,
    _i1.Transaction? transaction,
  }) async {
    return session.db.findSingleRow<Player>(
      where: where != null ? where(Player.t) : null,
      offset: offset,
      orderBy: orderBy,
      orderDescending: orderDescending,
      useCache: useCache,
      transaction: transaction,
    );
  }

  static Future<Player?> findById(
    _i1.Session session,
    int id,
  ) async {
    return session.db.findById<Player>(id);
  }

  static Future<int> delete(
    _i1.Session session, {
    required PlayerExpressionBuilder where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<Player>(
      where: where(Player.t),
      transaction: transaction,
    );
  }

  static Future<bool> deleteRow(
    _i1.Session session,
    Player row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow(
      row,
      transaction: transaction,
    );
  }

  static Future<bool> update(
    _i1.Session session,
    Player row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.update(
      row,
      transaction: transaction,
    );
  }

  static Future<void> insert(
    _i1.Session session,
    Player row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert(
      row,
      transaction: transaction,
    );
  }

  static Future<int> count(
    _i1.Session session, {
    PlayerExpressionBuilder? where,
    int? limit,
    bool useCache = true,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<Player>(
      where: where != null ? where(Player.t) : null,
      limit: limit,
      useCache: useCache,
      transaction: transaction,
    );
  }
}

typedef PlayerExpressionBuilder = _i1.Expression Function(PlayerTable);

class PlayerTable extends _i1.Table {
  PlayerTable() : super(tableName: 'player');

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  final id = _i1.ColumnInt('id');

  final username = _i1.ColumnString('username');

  @override
  List<_i1.Column> get columns => [
        id,
        username,
      ];
}

@Deprecated('Use PlayerTable.t instead.')
PlayerTable tPlayer = PlayerTable();
