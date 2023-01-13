import 'package:flutter/material.dart';

class PokemonService extends ChangeNotifier {
  int pokemonCount = 1;

  void changePokemonCount(int value) {
    pokemonCount += value;
    if (pokemonCount < 0) {
      pokemonCount = 0;
    }
    notifyListeners();
  }
}
