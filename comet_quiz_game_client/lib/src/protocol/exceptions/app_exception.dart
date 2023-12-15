/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: public_member_api_docs
// ignore_for_file: implementation_imports

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod_client/serverpod_client.dart' as _i1;

class AppException extends _i1.SerializableEntity
    implements _i1.SerializableException {
  AppException({required this.message});

  factory AppException.fromJson(
    Map<String, dynamic> jsonSerialization,
    _i1.SerializationManager serializationManager,
  ) {
    return AppException(
        message: serializationManager
            .deserialize<String>(jsonSerialization['message']));
  }

  String message;

  @override
  Map<String, dynamic> toJson() {
    return {'message': message};
  }
}
