import 'pokemon_api.dart';
import 'pokemon_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PokemonList extends StatefulWidget {
  const PokemonList({Key? key}) : super(key: key);

  @override
  State<PokemonList> createState() => _PokemonListState();
}

class _PokemonListState extends State<PokemonList> {
  int choosed = 0;
  final Border highlightBorder = Border.all(color: Colors.black, width: 5);

  @override
  Widget build(BuildContext context) {
    return Consumer<PokemonService>(builder: (_, pokemonService, __) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Pokemon List'),
        ),
        body: GridView.builder(
          itemCount: pokemonService.pokemonCount,
          itemBuilder: (BuildContext context, int index) {
            // return Image.network(genPokemonImageUrl(index + 1));
            return GestureDetector(
              // child: Image.network(genPokemonImageUrl(index + 1)),
              // onTap: () {
              //   // callback function when the item is tapped
              //   print('Item tapped: $index');
              // },
              onTap: () {
                setState(() {
                  // Toggle light when tapped.
                  choosed = index + 1;
                  pokemonService.changeTheme(choosed);
                });
              },
              child: choosed == index + 1
                  ? Container(
                      decoration: BoxDecoration(
                        border: highlightBorder,
                      ),
                      // Change button text when light changes state.
                      child: Image.network(genPokemonImageUrl(index + 1)),
                    )
                  : Container(
                      // Change button text when light changes state.
                      //child: Text(_selected ? 'TURN LIGHT OFF' : 'TURN LIGHT ON'),
                      child: Image.network(genPokemonImageUrl(index + 1)),
                    ),
            );
          },
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3),
        ),
      );
    });
  }
}
