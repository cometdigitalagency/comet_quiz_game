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

class _EndpointExample extends _i1.EndpointRef {
  _EndpointExample(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'example';

  _i2.Future<String> hello(String name) => caller.callServerEndpoint<String>(
        'example',
        'hello',
        {'name': name},
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
    example = _EndpointExample(this);
  }

  late final _EndpointExample example;

  @override
  Map<String, _i1.EndpointRef> get endpointRefLookup => {'example': example};
  @override
  Map<String, _i1.ModuleEndpointCaller> get moduleLookup => {};
}
