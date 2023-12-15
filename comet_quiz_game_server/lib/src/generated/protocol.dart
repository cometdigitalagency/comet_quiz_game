/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports

library protocol; // ignore_for_file: no_leading_underscores_for_library_prefixes

import 'package:serverpod/serverpod.dart' as _i1;
import 'package:serverpod/protocol.dart' as _i2;
import 'enums/game_status.dart' as _i3;
import 'exceptions/app_exception.dart' as _i4;
import 'payloads/answer_payload.dart' as _i5;
import 'payloads/join_room_payload.dart' as _i6;
import 'payloads/start_quiz_payload.dart' as _i7;
import 'responses/answer_response.dart' as _i8;
import 'responses/game_response.dart' as _i9;
import 'responses/list_answer_response.dart' as _i10;
import 'responses/participant.dart' as _i11;
import 'responses/player_score.dart' as _i12;
import 'schemas/answer.dart' as _i13;
import 'schemas/player.dart' as _i14;
import 'schemas/player_response.dart' as _i15;
import 'schemas/question.dart' as _i16;
import 'schemas/room.dart' as _i17;
import 'protocol.dart' as _i18;
import 'package:comet_quiz_game_server/src/generated/responses/player_score.dart'
    as _i19;
import 'package:comet_quiz_game_server/src/generated/schemas/answer.dart'
    as _i20;
export 'enums/game_status.dart';
export 'exceptions/app_exception.dart';
export 'payloads/answer_payload.dart';
export 'payloads/join_room_payload.dart';
export 'payloads/start_quiz_payload.dart';
export 'responses/answer_response.dart';
export 'responses/game_response.dart';
export 'responses/list_answer_response.dart';
export 'responses/participant.dart';
export 'responses/player_score.dart';
export 'schemas/answer.dart';
export 'schemas/player.dart';
export 'schemas/player_response.dart';
export 'schemas/question.dart';
export 'schemas/room.dart';

class Protocol extends _i1.SerializationManagerServer {
  Protocol._();

  factory Protocol() => _instance;

  static final Map<Type, _i1.constructor> customConstructors = {};

  static final Protocol _instance = Protocol._();

  static final targetDatabaseDefinition = _i2.DatabaseDefinition(tables: [
    _i2.TableDefinition(
      name: 'answer',
      schema: 'public',
      columns: [
        _i2.ColumnDefinition(
          name: 'id',
          columnType: _i2.ColumnType.integer,
          isNullable: false,
          dartType: 'int?',
          columnDefault: 'nextval(\'answer_id_seq\'::regclass)',
        ),
        _i2.ColumnDefinition(
          name: 'questionId',
          columnType: _i2.ColumnType.integer,
          isNullable: true,
          dartType: 'int?',
        ),
        _i2.ColumnDefinition(
          name: 'text',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'isCorrectOption',
          columnType: _i2.ColumnType.boolean,
          isNullable: false,
          dartType: 'bool',
        ),
      ],
      foreignKeys: [
        _i2.ForeignKeyDefinition(
          constraintName: 'answer_fk_0',
          columns: ['questionId'],
          referenceTable: 'question',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: null,
          onDelete: _i2.ForeignKeyAction.cascade,
          matchType: null,
        )
      ],
      indexes: [
        _i2.IndexDefinition(
          indexName: 'answer_pkey',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'id',
            )
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: true,
        )
      ],
      managed: true,
    ),
    _i2.TableDefinition(
      name: 'player',
      schema: 'public',
      columns: [
        _i2.ColumnDefinition(
          name: 'id',
          columnType: _i2.ColumnType.integer,
          isNullable: false,
          dartType: 'int?',
          columnDefault: 'nextval(\'player_id_seq\'::regclass)',
        ),
        _i2.ColumnDefinition(
          name: 'username',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
      ],
      foreignKeys: [],
      indexes: [
        _i2.IndexDefinition(
          indexName: 'player_pkey',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'id',
            )
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: true,
        )
      ],
      managed: true,
    ),
    _i2.TableDefinition(
      name: 'player_response',
      schema: 'public',
      columns: [
        _i2.ColumnDefinition(
          name: 'id',
          columnType: _i2.ColumnType.integer,
          isNullable: false,
          dartType: 'int?',
          columnDefault: 'nextval(\'player_response_id_seq\'::regclass)',
        ),
        _i2.ColumnDefinition(
          name: 'userId',
          columnType: _i2.ColumnType.integer,
          isNullable: false,
          dartType: 'int',
        ),
        _i2.ColumnDefinition(
          name: 'roomId',
          columnType: _i2.ColumnType.integer,
          isNullable: false,
          dartType: 'int',
        ),
        _i2.ColumnDefinition(
          name: 'questionId',
          columnType: _i2.ColumnType.integer,
          isNullable: false,
          dartType: 'int',
        ),
        _i2.ColumnDefinition(
          name: 'selectedAnswerId',
          columnType: _i2.ColumnType.integer,
          isNullable: false,
          dartType: 'int',
        ),
        _i2.ColumnDefinition(
          name: 'selectedAt',
          columnType: _i2.ColumnType.integer,
          isNullable: false,
          dartType: 'int',
        ),
      ],
      foreignKeys: [
        _i2.ForeignKeyDefinition(
          constraintName: 'player_response_fk_0',
          columns: ['userId'],
          referenceTable: 'player',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: null,
          onDelete: _i2.ForeignKeyAction.cascade,
          matchType: null,
        ),
        _i2.ForeignKeyDefinition(
          constraintName: 'player_response_fk_1',
          columns: ['roomId'],
          referenceTable: 'room',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: null,
          onDelete: _i2.ForeignKeyAction.cascade,
          matchType: null,
        ),
        _i2.ForeignKeyDefinition(
          constraintName: 'player_response_fk_2',
          columns: ['questionId'],
          referenceTable: 'question',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: null,
          onDelete: _i2.ForeignKeyAction.cascade,
          matchType: null,
        ),
        _i2.ForeignKeyDefinition(
          constraintName: 'player_response_fk_3',
          columns: ['selectedAnswerId'],
          referenceTable: 'answer',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: null,
          onDelete: _i2.ForeignKeyAction.cascade,
          matchType: null,
        ),
      ],
      indexes: [
        _i2.IndexDefinition(
          indexName: 'player_response_pkey',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'id',
            )
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: true,
        )
      ],
      managed: true,
    ),
    _i2.TableDefinition(
      name: 'question',
      schema: 'public',
      columns: [
        _i2.ColumnDefinition(
          name: 'id',
          columnType: _i2.ColumnType.integer,
          isNullable: false,
          dartType: 'int?',
          columnDefault: 'nextval(\'question_id_seq\'::regclass)',
        ),
        _i2.ColumnDefinition(
          name: 'text',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'roomId',
          columnType: _i2.ColumnType.integer,
          isNullable: false,
          dartType: 'int',
        ),
      ],
      foreignKeys: [
        _i2.ForeignKeyDefinition(
          constraintName: 'question_fk_0',
          columns: ['roomId'],
          referenceTable: 'room',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: null,
          onDelete: _i2.ForeignKeyAction.cascade,
          matchType: null,
        )
      ],
      indexes: [
        _i2.IndexDefinition(
          indexName: 'question_pkey',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'id',
            )
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: true,
        )
      ],
      managed: true,
    ),
    _i2.TableDefinition(
      name: 'room',
      schema: 'public',
      columns: [
        _i2.ColumnDefinition(
          name: 'id',
          columnType: _i2.ColumnType.integer,
          isNullable: false,
          dartType: 'int?',
          columnDefault: 'nextval(\'room_id_seq\'::regclass)',
        ),
        _i2.ColumnDefinition(
          name: 'name',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'startDate',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: true,
          dartType: 'DateTime?',
        ),
        _i2.ColumnDefinition(
          name: 'finishedDate',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: true,
          dartType: 'DateTime?',
        ),
      ],
      foreignKeys: [],
      indexes: [
        _i2.IndexDefinition(
          indexName: 'room_pkey',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'id',
            )
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: true,
        )
      ],
      managed: true,
    ),
    ..._i2.Protocol.targetDatabaseDefinition.tables,
  ]);

  @override
  T deserialize<T>(
    dynamic data, [
    Type? t,
  ]) {
    t ??= T;
    if (customConstructors.containsKey(t)) {
      return customConstructors[t]!(data, this) as T;
    }
    if (t == _i3.GameStatus) {
      return _i3.GameStatus.fromJson(data) as T;
    }
    if (t == _i4.AppException) {
      return _i4.AppException.fromJson(data, this) as T;
    }
    if (t == _i5.AnswerPayload) {
      return _i5.AnswerPayload.fromJson(data, this) as T;
    }
    if (t == _i6.JoinRoomPayload) {
      return _i6.JoinRoomPayload.fromJson(data, this) as T;
    }
    if (t == _i7.StartGamePayload) {
      return _i7.StartGamePayload.fromJson(data, this) as T;
    }
    if (t == _i8.AnswerResponse) {
      return _i8.AnswerResponse.fromJson(data, this) as T;
    }
    if (t == _i9.GameResponse) {
      return _i9.GameResponse.fromJson(data, this) as T;
    }
    if (t == _i10.ListAnswerResponse) {
      return _i10.ListAnswerResponse.fromJson(data, this) as T;
    }
    if (t == _i11.Participant) {
      return _i11.Participant.fromJson(data, this) as T;
    }
    if (t == _i12.PlayerScore) {
      return _i12.PlayerScore.fromJson(data, this) as T;
    }
    if (t == _i13.Answer) {
      return _i13.Answer.fromJson(data, this) as T;
    }
    if (t == _i14.Player) {
      return _i14.Player.fromJson(data, this) as T;
    }
    if (t == _i15.PlayerResponse) {
      return _i15.PlayerResponse.fromJson(data, this) as T;
    }
    if (t == _i16.Question) {
      return _i16.Question.fromJson(data, this) as T;
    }
    if (t == _i17.Room) {
      return _i17.Room.fromJson(data, this) as T;
    }
    if (t == _i1.getType<_i3.GameStatus?>()) {
      return (data != null ? _i3.GameStatus.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i4.AppException?>()) {
      return (data != null ? _i4.AppException.fromJson(data, this) : null) as T;
    }
    if (t == _i1.getType<_i5.AnswerPayload?>()) {
      return (data != null ? _i5.AnswerPayload.fromJson(data, this) : null)
          as T;
    }
    if (t == _i1.getType<_i6.JoinRoomPayload?>()) {
      return (data != null ? _i6.JoinRoomPayload.fromJson(data, this) : null)
          as T;
    }
    if (t == _i1.getType<_i7.StartGamePayload?>()) {
      return (data != null ? _i7.StartGamePayload.fromJson(data, this) : null)
          as T;
    }
    if (t == _i1.getType<_i8.AnswerResponse?>()) {
      return (data != null ? _i8.AnswerResponse.fromJson(data, this) : null)
          as T;
    }
    if (t == _i1.getType<_i9.GameResponse?>()) {
      return (data != null ? _i9.GameResponse.fromJson(data, this) : null) as T;
    }
    if (t == _i1.getType<_i10.ListAnswerResponse?>()) {
      return (data != null
          ? _i10.ListAnswerResponse.fromJson(data, this)
          : null) as T;
    }
    if (t == _i1.getType<_i11.Participant?>()) {
      return (data != null ? _i11.Participant.fromJson(data, this) : null) as T;
    }
    if (t == _i1.getType<_i12.PlayerScore?>()) {
      return (data != null ? _i12.PlayerScore.fromJson(data, this) : null) as T;
    }
    if (t == _i1.getType<_i13.Answer?>()) {
      return (data != null ? _i13.Answer.fromJson(data, this) : null) as T;
    }
    if (t == _i1.getType<_i14.Player?>()) {
      return (data != null ? _i14.Player.fromJson(data, this) : null) as T;
    }
    if (t == _i1.getType<_i15.PlayerResponse?>()) {
      return (data != null ? _i15.PlayerResponse.fromJson(data, this) : null)
          as T;
    }
    if (t == _i1.getType<_i16.Question?>()) {
      return (data != null ? _i16.Question.fromJson(data, this) : null) as T;
    }
    if (t == _i1.getType<_i17.Room?>()) {
      return (data != null ? _i17.Room.fromJson(data, this) : null) as T;
    }
    if (t == List<_i18.AnswerResponse>) {
      return (data as List)
          .map((e) => deserialize<_i18.AnswerResponse>(e))
          .toList() as dynamic;
    }
    if (t == List<_i18.Player>) {
      return (data as List).map((e) => deserialize<_i18.Player>(e)).toList()
          as dynamic;
    }
    if (t == _i1.getType<List<_i18.Answer>?>()) {
      return (data != null
          ? (data as List).map((e) => deserialize<_i18.Answer>(e)).toList()
          : null) as dynamic;
    }
    if (t == _i1.getType<List<_i18.Question>?>()) {
      return (data != null
          ? (data as List).map((e) => deserialize<_i18.Question>(e)).toList()
          : null) as dynamic;
    }
    if (t == List<_i19.PlayerScore>) {
      return (data as List)
          .map((e) => deserialize<_i19.PlayerScore>(e))
          .toList() as dynamic;
    }
    if (t == List<_i20.Answer>) {
      return (data as List).map((e) => deserialize<_i20.Answer>(e)).toList()
          as dynamic;
    }
    try {
      return _i2.Protocol().deserialize<T>(data, t);
    } catch (_) {}
    return super.deserialize<T>(data, t);
  }

  @override
  String? getClassNameForObject(Object data) {
    if (data is _i3.GameStatus) {
      return 'GameStatus';
    }
    if (data is _i4.AppException) {
      return 'AppException';
    }
    if (data is _i5.AnswerPayload) {
      return 'AnswerPayload';
    }
    if (data is _i6.JoinRoomPayload) {
      return 'JoinRoomPayload';
    }
    if (data is _i7.StartGamePayload) {
      return 'StartGamePayload';
    }
    if (data is _i8.AnswerResponse) {
      return 'AnswerResponse';
    }
    if (data is _i9.GameResponse) {
      return 'GameResponse';
    }
    if (data is _i10.ListAnswerResponse) {
      return 'ListAnswerResponse';
    }
    if (data is _i11.Participant) {
      return 'Participant';
    }
    if (data is _i12.PlayerScore) {
      return 'PlayerScore';
    }
    if (data is _i13.Answer) {
      return 'Answer';
    }
    if (data is _i14.Player) {
      return 'Player';
    }
    if (data is _i15.PlayerResponse) {
      return 'PlayerResponse';
    }
    if (data is _i16.Question) {
      return 'Question';
    }
    if (data is _i17.Room) {
      return 'Room';
    }
    return super.getClassNameForObject(data);
  }

  @override
  dynamic deserializeByClassName(Map<String, dynamic> data) {
    if (data['className'] == 'GameStatus') {
      return deserialize<_i3.GameStatus>(data['data']);
    }
    if (data['className'] == 'AppException') {
      return deserialize<_i4.AppException>(data['data']);
    }
    if (data['className'] == 'AnswerPayload') {
      return deserialize<_i5.AnswerPayload>(data['data']);
    }
    if (data['className'] == 'JoinRoomPayload') {
      return deserialize<_i6.JoinRoomPayload>(data['data']);
    }
    if (data['className'] == 'StartGamePayload') {
      return deserialize<_i7.StartGamePayload>(data['data']);
    }
    if (data['className'] == 'AnswerResponse') {
      return deserialize<_i8.AnswerResponse>(data['data']);
    }
    if (data['className'] == 'GameResponse') {
      return deserialize<_i9.GameResponse>(data['data']);
    }
    if (data['className'] == 'ListAnswerResponse') {
      return deserialize<_i10.ListAnswerResponse>(data['data']);
    }
    if (data['className'] == 'Participant') {
      return deserialize<_i11.Participant>(data['data']);
    }
    if (data['className'] == 'PlayerScore') {
      return deserialize<_i12.PlayerScore>(data['data']);
    }
    if (data['className'] == 'Answer') {
      return deserialize<_i13.Answer>(data['data']);
    }
    if (data['className'] == 'Player') {
      return deserialize<_i14.Player>(data['data']);
    }
    if (data['className'] == 'PlayerResponse') {
      return deserialize<_i15.PlayerResponse>(data['data']);
    }
    if (data['className'] == 'Question') {
      return deserialize<_i16.Question>(data['data']);
    }
    if (data['className'] == 'Room') {
      return deserialize<_i17.Room>(data['data']);
    }
    return super.deserializeByClassName(data);
  }

  @override
  _i1.Table? getTableForType(Type t) {
    {
      var table = _i2.Protocol().getTableForType(t);
      if (table != null) {
        return table;
      }
    }
    switch (t) {
      case _i13.Answer:
        return _i13.Answer.t;
      case _i14.Player:
        return _i14.Player.t;
      case _i15.PlayerResponse:
        return _i15.PlayerResponse.t;
      case _i16.Question:
        return _i16.Question.t;
      case _i17.Room:
        return _i17.Room.t;
    }
    return null;
  }

  @override
  _i2.DatabaseDefinition getTargetDatabaseDefinition() =>
      targetDatabaseDefinition;
}
