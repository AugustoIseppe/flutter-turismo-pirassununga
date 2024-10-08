import "dart:convert";

import "package:shared_preferences/shared_preferences.dart";

class Store {
// Adicionando um método em Store para salvar uma lista de favoritos
  static Future<bool> saveList(
      String key, List<Map<String, dynamic>> value) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.setString(
        key, jsonEncode(value)); // Salvando a lista como JSON
  }

// Modificação no método getMap para retornar uma lista em vez de um mapa
  static Future<List<Map<String, dynamic>>> getList(String key) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final jsonString = prefs.getString(key);
      if (jsonString != null) {
        final List<dynamic> jsonList = jsonDecode(jsonString);
        return jsonList.map((item) => item as Map<String, dynamic>).toList();
      }
      return [];
    } catch (_) {
      return [];
    }
  }
}
