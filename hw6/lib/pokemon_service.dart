import 'package:flutter/material.dart';
import 'pokemon_api.dart';

class PokemonService extends ChangeNotifier {
  int pokemonCount = 1;
  late PokemonInfo pokemonInfo;
  late MaterialColor colorCustom = Colors.blue; // default color
  String currentType = "grass";

  Map<int, Color> color = {
    50: Color.fromRGBO(136, 14, 79, .1),
    100: Color.fromRGBO(136, 14, 79, .2),
    200: Color.fromRGBO(136, 14, 79, .3),
    300: Color.fromRGBO(136, 14, 79, .4),
    400: Color.fromRGBO(136, 14, 79, .5),
    500: Color.fromRGBO(136, 14, 79, .6),
    600: Color.fromRGBO(136, 14, 79, .7),
    700: Color.fromRGBO(136, 14, 79, .8),
    800: Color.fromRGBO(136, 14, 79, .9),
    900: Color.fromRGBO(136, 14, 79, 1),
  };
  void typeToTheme() {
    int theme = 0xFFA8A77A;
    if (currentType == "normal") {
      theme = 0xFFA8A77A;
    } else if (currentType == "fire") {
      theme = 0xFFEE8130;
    } else if (currentType == "water") {
      theme = 0xFF6390F0;
    } else if (currentType == "electric") {
      theme = 0xFFF7D02C;
    } else if (currentType == "grass") {
      theme = 0xFF7AC74C;
    } else if (currentType == "ice") {
      theme = 0xFF96D9D6;
    } else if (currentType == "fighting") {
      theme = 0xFFC22E28;
    } else if (currentType == "poison") {
      theme = 0xFFA33EA1;
    } else if (currentType == "ground") {
      theme = 0xFFE2BF65;
    } else if (currentType == "flying") {
      theme = 0xFFA98FF3;
    } else if (currentType == "psychic") {
      theme = 0xFFF95587;
    } else if (currentType == "bug") {
      theme = 0xFFA6B91A;
    } else if (currentType == "rock") {
      theme = 0xFFB6A136;
    } else if (currentType == "ghost") {
      theme = 0xFF735797;
    } else if (currentType == "dragon") {
      theme = 0xFF6F35FC;
    } else if (currentType == "dark") {
      theme = 0xFF705746;
    } else if (currentType == "steel") {
      theme = 0xFFB7B7CE;
    } else {
      theme = 0xFFD685AD;
    }
    // print(theme);
    colorCustom = MaterialColor(theme, color);
    //print(colorCustom);
    // return colorCustom;
  }

  void changePokemonCount(int value) {
    pokemonCount += value;
    if (pokemonCount < 0) {
      pokemonCount = 0;
    }
    notifyListeners();
  }

  void changeTheme(int pokeId) async {
    pokemonInfo = await fetchPokemonInfo(pokeId);
    currentType = (pokemonInfo.types[0]);
    typeToTheme();
    // print(currentType);
    notifyListeners();
  }
}
