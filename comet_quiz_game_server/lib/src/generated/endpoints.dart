/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod/serverpod.dart' as _i1;
import '../endpoints/main_endpoint.dart' as _i2;
import '../endpoints/register_endpoint.dart' as _i3;
import 'package:comet_quiz_game_server/src/generated/schemas/question.dart'
    as _i4;
import 'package:comet_quiz_game_server/src/generated/schemas/answer.dart'
    as _i5;
import 'package:comet_quiz_game_server/src/generated/schemas/room.dart' as _i6;

class Endpoints extends _i1.EndpointDispatch {
  @override
  void initializeEndpoints(_i1.Server server) {
    var endpoints = <String, _i1.Endpoint>{
      'main': _i2.MainEndpoint()
        ..initialize(
          server,
          'main',
          null,
        ),
      'register': _i3.RegisterEndpoint()
        ..initialize(
          server,
          'register',
          null,
        ),
    };
    connectors['main'] = _i1.EndpointConnector(
      name: 'main',
      endpoint: endpoints['main']!,
      methodConnectors: {
        'createPlayer': _i1.MethodConnector(
          name: 'createPlayer',
          params: {
            'username': _i1.ParameterDescription(
              name: 'username',
              type: _i1.getType<String>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['main'] as _i2.MainEndpoint).createPlayer(
            session,
            params['username'],
          ),
        ),
        'getQuestions': _i1.MethodConnector(
          name: 'getQuestions',
          params: {
            'roomId': _i1.ParameterDescription(
              name: 'roomId',
              type: _i1.getType<int>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['main'] as _i2.MainEndpoint).getQuestions(
            session,
            params['roomId'],
          ),
        ),
        'getAllResults': _i1.MethodConnector(
          name: 'getAllResults',
          params: {
            'roomId': _i1.ParameterDescription(
              name: 'roomId',
              type: _i1.getType<int>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['main'] as _i2.MainEndpoint).getAllResults(
            session,
            params['roomId'],
          ),
        ),
      },
    );
    connectors['register'] = _i1.EndpointConnector(
      name: 'register',
      endpoint: endpoints['register']!,
      methodConnectors: {
        'createQuestion': _i1.MethodConnector(
          name: 'createQuestion',
          params: {
            'question': _i1.ParameterDescription(
              name: 'question',
              type: _i1.getType<_i4.Question>(),
              nullable: false,
            ),
            'answers': _i1.ParameterDescription(
              name: 'answers',
              type: _i1.getType<List<_i5.Answer>>(),
              nullable: false,
            ),
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['register'] as _i3.RegisterEndpoint).createQuestion(
            session,
            params['question'],
            params['answers'],
          ),
        ),
        'createRoom': _i1.MethodConnector(
          name: 'createRoom',
          params: {
            'room': _i1.ParameterDescription(
              name: 'room',
              type: _i1.getType<_i6.Room>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['register'] as _i3.RegisterEndpoint).createRoom(
            session,
            params['room'],
          ),
        ),
      },
    );
  }
}
