import 'package:flutter/material.dart';

// int _favoritedCounter = 0;
void main() {
  runApp(
    MyApp(
      items: List<String>.generate(
          150,
          (i) =>
              'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/home/${i + 1}.png'), // generate a list of 150 Pokemon
    ),
  );
}

class MyApp extends StatefulWidget {
  final List<String> items;

  const MyApp({super.key, required this.items});

  @override
  MyAppState createState() => MyAppState();
}

class MyAppState extends State<MyApp> {
  int _favoritedCounter = 0;
  late List<FavoriteWidget> favoritedList;

  void _handleFavoritedChanged(bool isFavorited) {
    if (isFavorited) {
      setState(() {
        _favoritedCounter++;
        //_isFavorited = false;
      });
      // print('$isFavorited if');
    } else {
      setState(() {
        _favoritedCounter--;
        // _isFavorited = true;
      });
      // print('$isFavorited else');
    }
  }

  @override
  void initState() {
    super.initState();
    favoritedList = List<FavoriteWidget>.generate(
        150,
        (i) => FavoriteWidget(
              favoriteCount: _favoritedCounter,
              onChanged: _handleFavoritedChanged,
            ));
  }

  @override
  Widget build(BuildContext context) {
    const title = 'Pokemon List';

    return MaterialApp(
      title: title,
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text((() {
            if (_favoritedCounter == 0) {
              return title;
            }

            return "$title [$_favoritedCounter]";
          })()),
        ),
        body: ListView.builder(
          itemCount: widget.items.length ~/
              3, // 3 items per row so we divide the number of items by 3
          itemBuilder: (context, index) {
            // bool _isFavorited = savedLike.contains(widget.items[index * 3]);

            return Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                    child: Stack(
                  // Stack is for overlaying Favorite icon on top of image
                  children: [
                    Image.network(widget.items[index * 3]),
                    favoritedList[index * 3],
                    // IconButton(
                    //   icon: (_isFavorited
                    //       ? const Icon(
                    //           Icons.favorite,
                    //           color: Colors.red,
                    //           size: 50,
                    //         )
                    //       : const Icon(
                    //           Icons.favorite_border,
                    //           size: 50,
                    //         )),
                    //   color: Colors.black,
                    //   iconSize: 50,
                    //   onPressed: () {
                    //     setState(() {
                    //       if (_isFavorited) {
                    //         _favoritedCounter--;
                    //         _isFavorited = false;
                    //         savedLike.remove(widget.items[index * 3]);
                    //         print(savedLike);
                    //       } else {
                    //         savedLike.add(widget.items[index * 3]);
                    //         _favoritedCounter++;
                    //         _isFavorited = true;
                    //         print(savedLike);
                    //       }
                    //     });
                    //   },
                    // ),
                  ],
                )),
                Expanded(
                    child: Stack(
                  children: [
                    Image.network(widget.items[index * 3 + 1]),
                    favoritedList[index * 3 + 1],
                    // FavoriteWidget(
                    //   isFavorited: _isFavorited,
                    //   favoriteCount: _favoritedCounter,
                    //   onChanged: _handleFavoritedChanged,
                    // ),
                  ],
                )),
                Expanded(
                    child: Stack(
                  children: [
                    Image.network(widget.items[index * 3 + 2]),
                    favoritedList[index * 3 + 2],
                    // FavoriteWidget(
                    //   isFavorited: _isFavorited,
                    //   favoriteCount: _favoritedCounter,
                    //   onChanged: _handleFavoritedChanged,
                    // ),
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

class FavoriteWidget extends StatefulWidget {
  FavoriteWidget({
    super.key,
    this.favoriteCount = 0,
    required this.onChanged,
  });

  final ValueChanged<bool> onChanged;
  final int favoriteCount;

  @override
  FavoriteState createState() => FavoriteState();
}

class FavoriteState extends State<FavoriteWidget> {
  bool isfav = false;

  void handleTap() {
    setState(() {
      isfav = !isfav;
      widget.onChanged(isfav);
      //_isFavorited = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return (IconButton(
      icon: (isfav
          ? const Icon(
              Icons.favorite,
              color: Colors.red,
              size: 50,
            )
          : const Icon(
              Icons.favorite_border,
              size: 50,
            )),
      color: Colors.black,
      iconSize: 50,
      onPressed: handleTap,
    ));
  }
}
