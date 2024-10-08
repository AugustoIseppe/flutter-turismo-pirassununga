import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserFavorites with ChangeNotifier {
  List<Map<String, dynamic>> _locaisFavoritos = [];
  List<Map<String, dynamic>> get locaisFavoritos => _locaisFavoritos;

  // Adicione este método para carregar a lista de favoritos do SharedPreferences
Future<void> carregarLocaisFavoritos() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  List<String> locaisFavoritosString = prefs.getStringList("savedLocaisFavoritos") ?? [];

  // Convertendo cada string de volta para um mapa e atribuindo à lista de favoritos
  _locaisFavoritos = locaisFavoritosString.map((json) => jsonDecode(json)).cast<Map<String, dynamic>>().toList();

  notifyListeners();
}



  // Atualize este método para salvar a lista de favoritos no SharedPreferences
  Future<void> adicionarLocalFavorito(Map<String, dynamic> local) async {
    _locaisFavoritos.add(local);
    await _salvarLocaisFavoritosNoSharedPreferences();
    notifyListeners();
  }

//   Future<void> removerLocalFavorito(Map<String, dynamic> local) async {
//   int localid = local['localid'];
//   _locaisFavoritos.removeWhere((element) => element['localid'] == localid);
//   await _salvarLocaisFavoritosNoSharedPreferences();
//   notifyListeners();
// }

  Future<void> removerLocalFavorito(Map<String, dynamic> local) async {
    _locaisFavoritos.remove(local);
    await _salvarLocaisFavoritosNoSharedPreferences();
    notifyListeners();
  }

  Future<void> _salvarLocaisFavoritosNoSharedPreferences() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> locaisFavoritosString = _locaisFavoritos.map((local) => jsonEncode(local)).toList();
    prefs.setStringList("savedLocaisFavoritos", locaisFavoritosString);
  }

  int get itemCount {
    return _locaisFavoritos.length;
  }
}
