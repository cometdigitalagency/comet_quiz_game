import 'dart:convert';

import 'package:comet_quiz_game_client/comet_quiz_game_client.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalStorage {
  final SharedPreferences sharedPreferences;

  LocalStorage({required this.sharedPreferences});

  Future<void> saveObject<T extends SerializableEntity>(
      String key, T? object) async {
    if (object == null) await sharedPreferences.remove(key);
    final json = jsonEncode(object?.toJson());
    await sharedPreferences.setString(key, json);
  }

  Map<String, dynamic>? getObject(String key) {
    final json = sharedPreferences.getString(key);
    if (json == null) return null;
    return jsonDecode(json);
  }
}
