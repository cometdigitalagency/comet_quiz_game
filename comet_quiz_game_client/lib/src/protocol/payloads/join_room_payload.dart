/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod_client/serverpod_client.dart' as _i1;
import '../protocol.dart' as _i2;

class JoinRoomPayload extends _i1.SerializableEntity {
  JoinRoomPayload({
    required this.player,
    required this.roomId,
  });

  factory JoinRoomPayload.fromJson(
    Map<String, dynamic> jsonSerialization,
    _i1.SerializationManager serializationManager,
  ) {
    return JoinRoomPayload(
      player: serializationManager
          .deserialize<_i2.Player>(jsonSerialization['player']),
      roomId:
          serializationManager.deserialize<int>(jsonSerialization['roomId']),
    );
  }

  _i2.Player player;

  int roomId;

  @override
  Map<String, dynamic> toJson() {
    return {
      'player': player,
      'roomId': roomId,
    };
  }
}
