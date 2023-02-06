import 'my_bottom_navigation.dart';
import 'pokemon_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider<PokemonService>(
      create: (_) => PokemonService(),
      child: const MyPokemonApp(),
    ),
  );
}

class MyPokemonApp extends StatefulWidget {
  const MyPokemonApp({super.key});
  @override
  State<MyPokemonApp> createState() => _MyPokemonAppState();
}

class _MyPokemonAppState extends State<MyPokemonApp> {
  // final ThemeData theme = Colors.blue;
  // This widget is the root of your application.
  // late Color themeColor;

  // void setThemeColor(Color theme) {
  //   themeColor = theme;
  // }

  @override
  Widget build(BuildContext context) {
    return Consumer<PokemonService>(
      builder: (_, pokemonService, __) {
        // print(pokemonService.currentType);
        // print(pokemonService.colorCustom);
        return MaterialApp(
          title: 'Pokemon Demo',
          theme: ThemeData(
            // colorScheme: ColorScheme.fromSwatch().copyWith(
            // primary: (pokemonService.typeToTheme()),
            primarySwatch: pokemonService.colorCustom,

            // ),
          ),
          home: const MyBottomNavigation(),
        );
      },
    );
  }
}
