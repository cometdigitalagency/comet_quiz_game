/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod_client/serverpod_client.dart' as _i1;
import 'dart:async' as _i2;
import 'package:comet_quiz_game_client/src/protocol/schemas/player.dart' as _i3;
import 'package:comet_quiz_game_client/src/protocol/schemas/room.dart' as _i4;
import 'package:comet_quiz_game_client/src/protocol/responses/player_score.dart'
    as _i5;
import 'package:comet_quiz_game_client/src/protocol/schemas/question.dart'
    as _i6;
import 'package:comet_quiz_game_client/src/protocol/schemas/answer.dart' as _i7;
import 'dart:io' as _i8;
import 'protocol.dart' as _i9;

class _EndpointMain extends _i1.EndpointRef {
  _EndpointMain(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'main';

  _i2.Future<_i3.Player> createPlayer(String username) =>
      caller.callServerEndpoint<_i3.Player>(
        'main',
        'createPlayer',
        {'username': username},
      );

  _i2.Future<_i4.Room> getQuestions(int roomId) =>
      caller.callServerEndpoint<_i4.Room>(
        'main',
        'getQuestions',
        {'roomId': roomId},
      );

  _i2.Future<List<_i5.PlayerScore>> getAllResults(int roomId) =>
      caller.callServerEndpoint<List<_i5.PlayerScore>>(
        'main',
        'getAllResults',
        {'roomId': roomId},
      );
}

class _EndpointRegister extends _i1.EndpointRef {
  _EndpointRegister(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'register';

  _i2.Future<_i6.Question> createQuestion(
    _i6.Question question,
    List<_i7.Answer> answers,
  ) =>
      caller.callServerEndpoint<_i6.Question>(
        'register',
        'createQuestion',
        {
          'question': question,
          'answers': answers,
        },
      );

  _i2.Future<_i4.Room> createRoom(_i4.Room room) =>
      caller.callServerEndpoint<_i4.Room>(
        'register',
        'createRoom',
        {'room': room},
      );
}

class Client extends _i1.ServerpodClient {
  Client(
    String host, {
    _i8.SecurityContext? context,
    _i1.AuthenticationKeyManager? authenticationKeyManager,
  }) : super(
          host,
          _i9.Protocol(),
          context: context,
          authenticationKeyManager: authenticationKeyManager,
        ) {
    main = _EndpointMain(this);
    register = _EndpointRegister(this);
  }

  late final _EndpointMain main;

  late final _EndpointRegister register;

  @override
  Map<String, _i1.EndpointRef> get endpointRefLookup => {
        'main': main,
        'register': register,
      };

  @override
  Map<String, _i1.ModuleEndpointCaller> get moduleLookup => {};
}
