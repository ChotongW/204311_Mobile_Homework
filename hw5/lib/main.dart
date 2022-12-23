import 'package:flutter/material.dart';

void main() {
  runApp(
    MyApp(
      items: List<String>.generate(150, (i) => 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/home/${i+1}.png'), // generate a list of 150 Pokemon
    ),
  );
}

class MyApp extends StatelessWidget {
  final List<String> items;

  const MyApp({super.key, required this.items});

  @override
  Widget build(BuildContext context) {
    const title = 'Pokemon List';

    return MaterialApp(
      title: title,
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true, 
          title: const Text(title),
        ),
        body: ListView.builder(
          itemCount: items.length ~/ 3, // 3 items per row so we divide the number of items by 3
          itemBuilder: (context, index) {
            return Row(
              children: [
                Expanded(child: Stack( // Stack is for overlaying Favorite icon on top of image
                  children: [
                    Image.network(items[index*3]),
                    const IconButton(
  
  icon: const Icon(Icons.favorite_border, size : 50,color: Colors.black),
  onPressed: (null) 
),
                  ],
                )),
                Expanded(child: Stack(
                  children: [
                    Image.network(items[index*3+1]),
                    const Icon(Icons.favorite_border, size: 50,),
                  ],
                )),
                Expanded(child: Stack(
                  children: [
                    Image.network(items[index*3+2]),
                    const Icon(Icons.favorite_border, size: 50,),
                  ],
                )),
              ],
            );
          },
        ),
      ),
    );
  }
}

class FavoriteWidget extends StatefulWidget{
  const FavoriteWidget({super.key});
  @override
  State<FavoriteWidget> createState() => _FavoriteWidgetState();


}

class _FavoriteWidgetState extends State<FavoriteWidget>{
  bool _isFavorited = false;
  @override
  Widget build(BuildContext context){
    return(Row(children: [IconButton(
  
  icon: (_isFavorited ? const Icon(Icons.favorite): Icon(Icons.favorite_border)),
  color: Colors.black,
  onPressed: (){} 
),],));
  }
}