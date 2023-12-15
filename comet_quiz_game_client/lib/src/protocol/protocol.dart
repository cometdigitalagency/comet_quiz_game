/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports

library protocol; // ignore_for_file: no_leading_underscores_for_library_prefixes

import 'package:serverpod_client/serverpod_client.dart' as _i1;
import 'enums/game_status.dart' as _i2;
import 'exceptions/app_exception.dart' as _i3;
import 'payloads/answer_payload.dart' as _i4;
import 'payloads/join_room_payload.dart' as _i5;
import 'payloads/start_quiz_payload.dart' as _i6;
import 'responses/answer_response.dart' as _i7;
import 'responses/game_response.dart' as _i8;
import 'responses/list_answer_response.dart' as _i9;
import 'responses/participant.dart' as _i10;
import 'responses/player_score.dart' as _i11;
import 'schemas/answer.dart' as _i12;
import 'schemas/player.dart' as _i13;
import 'schemas/player_response.dart' as _i14;
import 'schemas/question.dart' as _i15;
import 'schemas/room.dart' as _i16;
import 'protocol.dart' as _i17;
import 'package:comet_quiz_game_client/src/protocol/responses/player_score.dart'
    as _i18;
import 'package:comet_quiz_game_client/src/protocol/schemas/answer.dart'
    as _i19;
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
export 'client.dart';

class Protocol extends _i1.SerializationManager {
  Protocol._();

  factory Protocol() => _instance;

  static final Map<Type, _i1.constructor> customConstructors = {};

  static final Protocol _instance = Protocol._();

  @override
  T deserialize<T>(
    dynamic data, [
    Type? t,
  ]) {
    t ??= T;
    if (customConstructors.containsKey(t)) {
      return customConstructors[t]!(data, this) as T;
    }
    if (t == _i2.GameStatus) {
      return _i2.GameStatus.fromJson(data) as T;
    }
    if (t == _i3.AppException) {
      return _i3.AppException.fromJson(data, this) as T;
    }
    if (t == _i4.AnswerPayload) {
      return _i4.AnswerPayload.fromJson(data, this) as T;
    }
    if (t == _i5.JoinRoomPayload) {
      return _i5.JoinRoomPayload.fromJson(data, this) as T;
    }
    if (t == _i6.StartGamePayload) {
      return _i6.StartGamePayload.fromJson(data, this) as T;
    }
    if (t == _i7.AnswerResponse) {
      return _i7.AnswerResponse.fromJson(data, this) as T;
    }
    if (t == _i8.GameResponse) {
      return _i8.GameResponse.fromJson(data, this) as T;
    }
    if (t == _i9.ListAnswerResponse) {
      return _i9.ListAnswerResponse.fromJson(data, this) as T;
    }
    if (t == _i10.Participant) {
      return _i10.Participant.fromJson(data, this) as T;
    }
    if (t == _i11.PlayerScore) {
      return _i11.PlayerScore.fromJson(data, this) as T;
    }
    if (t == _i12.Answer) {
      return _i12.Answer.fromJson(data, this) as T;
    }
    if (t == _i13.Player) {
      return _i13.Player.fromJson(data, this) as T;
    }
    if (t == _i14.PlayerResponse) {
      return _i14.PlayerResponse.fromJson(data, this) as T;
    }
    if (t == _i15.Question) {
      return _i15.Question.fromJson(data, this) as T;
    }
    if (t == _i16.Room) {
      return _i16.Room.fromJson(data, this) as T;
    }
    if (t == _i1.getType<_i2.GameStatus?>()) {
      return (data != null ? _i2.GameStatus.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i3.AppException?>()) {
      return (data != null ? _i3.AppException.fromJson(data, this) : null) as T;
    }
    if (t == _i1.getType<_i4.AnswerPayload?>()) {
      return (data != null ? _i4.AnswerPayload.fromJson(data, this) : null)
          as T;
    }
    if (t == _i1.getType<_i5.JoinRoomPayload?>()) {
      return (data != null ? _i5.JoinRoomPayload.fromJson(data, this) : null)
          as T;
    }
    if (t == _i1.getType<_i6.StartGamePayload?>()) {
      return (data != null ? _i6.StartGamePayload.fromJson(data, this) : null)
          as T;
    }
    if (t == _i1.getType<_i7.AnswerResponse?>()) {
      return (data != null ? _i7.AnswerResponse.fromJson(data, this) : null)
          as T;
    }
    if (t == _i1.getType<_i8.GameResponse?>()) {
      return (data != null ? _i8.GameResponse.fromJson(data, this) : null) as T;
    }
    if (t == _i1.getType<_i9.ListAnswerResponse?>()) {
      return (data != null ? _i9.ListAnswerResponse.fromJson(data, this) : null)
          as T;
    }
    if (t == _i1.getType<_i10.Participant?>()) {
      return (data != null ? _i10.Participant.fromJson(data, this) : null) as T;
    }
    if (t == _i1.getType<_i11.PlayerScore?>()) {
      return (data != null ? _i11.PlayerScore.fromJson(data, this) : null) as T;
    }
    if (t == _i1.getType<_i12.Answer?>()) {
      return (data != null ? _i12.Answer.fromJson(data, this) : null) as T;
    }
    if (t == _i1.getType<_i13.Player?>()) {
      return (data != null ? _i13.Player.fromJson(data, this) : null) as T;
    }
    if (t == _i1.getType<_i14.PlayerResponse?>()) {
      return (data != null ? _i14.PlayerResponse.fromJson(data, this) : null)
          as T;
    }
    if (t == _i1.getType<_i15.Question?>()) {
      return (data != null ? _i15.Question.fromJson(data, this) : null) as T;
    }
    if (t == _i1.getType<_i16.Room?>()) {
      return (data != null ? _i16.Room.fromJson(data, this) : null) as T;
    }
    if (t == List<_i17.AnswerResponse>) {
      return (data as List)
          .map((e) => deserialize<_i17.AnswerResponse>(e))
          .toList() as dynamic;
    }
    if (t == List<_i17.Player>) {
      return (data as List).map((e) => deserialize<_i17.Player>(e)).toList()
          as dynamic;
    }
    if (t == _i1.getType<List<_i17.Answer>?>()) {
      return (data != null
          ? (data as List).map((e) => deserialize<_i17.Answer>(e)).toList()
          : null) as dynamic;
    }
    if (t == _i1.getType<List<_i17.Question>?>()) {
      return (data != null
          ? (data as List).map((e) => deserialize<_i17.Question>(e)).toList()
          : null) as dynamic;
    }
    if (t == List<_i18.PlayerScore>) {
      return (data as List)
          .map((e) => deserialize<_i18.PlayerScore>(e))
          .toList() as dynamic;
    }
    if (t == List<_i19.Answer>) {
      return (data as List).map((e) => deserialize<_i19.Answer>(e)).toList()
          as dynamic;
    }
    return super.deserialize<T>(data, t);
  }

  @override
  String? getClassNameForObject(Object data) {
    if (data is _i2.GameStatus) {
      return 'GameStatus';
    }
    if (data is _i3.AppException) {
      return 'AppException';
    }
    if (data is _i4.AnswerPayload) {
      return 'AnswerPayload';
    }
    if (data is _i5.JoinRoomPayload) {
      return 'JoinRoomPayload';
    }
    if (data is _i6.StartGamePayload) {
      return 'StartGamePayload';
    }
    if (data is _i7.AnswerResponse) {
      return 'AnswerResponse';
    }
    if (data is _i8.GameResponse) {
      return 'GameResponse';
    }
    if (data is _i9.ListAnswerResponse) {
      return 'ListAnswerResponse';
    }
    if (data is _i10.Participant) {
      return 'Participant';
    }
    if (data is _i11.PlayerScore) {
      return 'PlayerScore';
    }
    if (data is _i12.Answer) {
      return 'Answer';
    }
    if (data is _i13.Player) {
      return 'Player';
    }
    if (data is _i14.PlayerResponse) {
      return 'PlayerResponse';
    }
    if (data is _i15.Question) {
      return 'Question';
    }
    if (data is _i16.Room) {
      return 'Room';
    }
    return super.getClassNameForObject(data);
  }

  @override
  dynamic deserializeByClassName(Map<String, dynamic> data) {
    if (data['className'] == 'GameStatus') {
      return deserialize<_i2.GameStatus>(data['data']);
    }
    if (data['className'] == 'AppException') {
      return deserialize<_i3.AppException>(data['data']);
    }
    if (data['className'] == 'AnswerPayload') {
      return deserialize<_i4.AnswerPayload>(data['data']);
    }
    if (data['className'] == 'JoinRoomPayload') {
      return deserialize<_i5.JoinRoomPayload>(data['data']);
    }
    if (data['className'] == 'StartGamePayload') {
      return deserialize<_i6.StartGamePayload>(data['data']);
    }
    if (data['className'] == 'AnswerResponse') {
      return deserialize<_i7.AnswerResponse>(data['data']);
    }
    if (data['className'] == 'GameResponse') {
      return deserialize<_i8.GameResponse>(data['data']);
    }
    if (data['className'] == 'ListAnswerResponse') {
      return deserialize<_i9.ListAnswerResponse>(data['data']);
    }
    if (data['className'] == 'Participant') {
      return deserialize<_i10.Participant>(data['data']);
    }
    if (data['className'] == 'PlayerScore') {
      return deserialize<_i11.PlayerScore>(data['data']);
    }
    if (data['className'] == 'Answer') {
      return deserialize<_i12.Answer>(data['data']);
    }
    if (data['className'] == 'Player') {
      return deserialize<_i13.Player>(data['data']);
    }
    if (data['className'] == 'PlayerResponse') {
      return deserialize<_i14.PlayerResponse>(data['data']);
    }
    if (data['className'] == 'Question') {
      return deserialize<_i15.Question>(data['data']);
    }
    if (data['className'] == 'Room') {
      return deserialize<_i16.Room>(data['data']);
    }
    return super.deserializeByClassName(data);
  }
}
