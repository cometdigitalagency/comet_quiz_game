/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod_client/serverpod_client.dart' as _i1;
import '../protocol.dart' as _i2;

class GameResponse extends _i1.SerializableEntity {
  GameResponse({
    required this.roomId,
    required this.status,
    required this.time,
    this.question,
    required this.participants,
  });

  factory GameResponse.fromJson(
    Map<String, dynamic> jsonSerialization,
    _i1.SerializationManager serializationManager,
  ) {
    return GameResponse(
      roomId:
          serializationManager.deserialize<int>(jsonSerialization['roomId']),
      status: serializationManager
          .deserialize<_i2.GameStatus>(jsonSerialization['status']),
      time: serializationManager.deserialize<int>(jsonSerialization['time']),
      question: serializationManager
          .deserialize<_i2.Question?>(jsonSerialization['question']),
      participants: serializationManager
          .deserialize<int>(jsonSerialization['participants']),
    );
  }

  int roomId;

  _i2.GameStatus status;

  int time;

  _i2.Question? question;

  int participants;

  @override
  Map<String, dynamic> toJson() {
    return {
      'roomId': roomId,
      'status': status,
      'time': time,
      'question': question,
      'participants': participants,
    };
  }
}
