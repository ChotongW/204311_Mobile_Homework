import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        brightness: Brightness.light,
        /* light theme settings */
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        /* dark theme settings */
      ),
      themeMode: ThemeMode.dark,
      /* ThemeMode.system to follow system theme, 
         ThemeMode.light for light theme, 
         ThemeMode.dark for dark theme
      */
      debugShowCheckedModeBanner: false,
      home: const MyHomePage(title: 'Chiang Mai'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<String> images = [
    "assets/images/s1.webp",
    "assets/images/s2.webp",
    "assets/images/s3.webp",
    "assets/images/s4.webp",
    "assets/images/s5.webp"
  ];
  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        leading: const IconButton(
          onPressed: null,
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.pinkAccent,
          ),
        ),
        centerTitle: true,
        title: Text(widget.title),
        actions: [
          IconButton(onPressed: null, icon: Icon(Icons.ios_share_rounded)),
          IconButton(
              onPressed: null, icon: Icon(Icons.favorite_border_outlined))
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Align(
              alignment: Alignment.topCenter,
              child: CarouselSlider(
                options: CarouselOptions(height: 200.0),
                items: images.map((i) {
                  return Builder(
                    builder: (BuildContext context) {
                      return Container(
                        width: MediaQuery.of(context).size.width,
                        margin: EdgeInsets.symmetric(horizontal: 5.0),
                        child:
                            // 'text $i',
                            // style: TextStyle(fontSize: 16.0),
                            Image.asset(
                          i,
                          fit: BoxFit.cover,
                        ),
                      );
                    },
                  );
                }).toList(),
              ),
            ),

            // Image.asset(images[0], width: 300, height: 100)
          ],
        ),
      ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: _loginUser,
      //   tooltip: 'login',
      //   child: const Icon(Icons.login),
      // ),
      bottomNavigationBar: Container(
        height: 60,
        color: Colors.blueAccent,
        child: InkWell(
          onTap: () => print('Select room'),
          child: Padding(
            padding: EdgeInsets.only(top: 20.0),
            child: Column(
              children: const <Widget>[
                Text('Select a room', textAlign: TextAlign.center),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
