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
        actions: const [
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
            Container(
              padding: const EdgeInsets.only(left: 10, top: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  const Align(
                    alignment: Alignment.centerLeft,
                    child: Text("UNESCO Sustainable Travel Pledge"),
                  ),
                  SizedBox(height: 10),
                  const Text(
                    'Shangri-La Chiang Mai',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                  ),
                  Container(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Icon(
                          Icons.star,
                          color: Colors.grey[500],
                        ),
                        Icon(
                          Icons.star,
                          color: Colors.grey[500],
                        ),
                        Icon(
                          Icons.star,
                          color: Colors.grey[500],
                        ),
                        Icon(
                          Icons.star,
                          color: Colors.grey[500],
                        ),
                        Icon(
                          Icons.star,
                          color: Colors.grey[500],
                        ),
                      ],
                    ),
                  ),
                  const Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Luxury hotel with free water park, near Chiang Mai Night Bazaar',
                      style: TextStyle(
                          fontWeight: FontWeight.normal, fontSize: 20),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.only(left: 10, top: 50),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  const Align(
                    alignment: Alignment.centerLeft,
                    child: Text("9.0/10 Superb",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20)),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    '1,000 verified Hotels.com guest reviews',
                    style:
                        TextStyle(fontWeight: FontWeight.normal, fontSize: 15),
                  ),
                  TextButton(
                    onPressed: null,
                    style: TextButton.styleFrom(
                      primary: Colors.purpleAccent,
                      onSurface: Colors.blue,
                    ),
                    child: const Text(
                      'See all 1,000 reviews  >',
                      style: TextStyle(
                          fontWeight: FontWeight.normal, fontSize: 15),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.only(left: 10, top: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  const Align(
                    alignment: Alignment.centerLeft,
                    child: Text("Popular amenities",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20)),
                  ),
                  const SizedBox(height: 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const <Widget>[
                          Icon(
                            Icons.wifi,
                            color: Colors.white,
                          ),
                          SizedBox(width: 10),
                          Text("Free WiFi",
                              style: TextStyle(
                                  fontWeight: FontWeight.normal, fontSize: 15)),
                          SizedBox(width: 90),
                          Icon(
                            Icons.pool,
                            color: Colors.white,
                          ),
                          SizedBox(width: 10),
                          Text("Pool",
                              style: TextStyle(
                                  fontWeight: FontWeight.normal, fontSize: 15)),
                        ],
                      ),
                      const SizedBox(height: 10),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const <Widget>[
                          Icon(
                            Icons.ac_unit_sharp,
                            color: Colors.white,
                          ),
                          SizedBox(width: 10),
                          Text("Air Conditioning",
                              style: TextStyle(
                                  fontWeight: FontWeight.normal, fontSize: 15)),
                          SizedBox(width: 45),
                          Icon(
                            Icons.drive_eta,
                            color: Colors.white,
                          ),
                          SizedBox(width: 10),
                          Text("Free Parking",
                              style: TextStyle(
                                  fontWeight: FontWeight.normal, fontSize: 15)),
                        ],
                      ),
                      const SizedBox(height: 10),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const <Widget>[
                          Icon(
                            Icons.fitness_center,
                            color: Colors.white,
                          ),
                          SizedBox(width: 10),
                          Text("Gym",
                              style: TextStyle(
                                  fontWeight: FontWeight.normal, fontSize: 15)),
                          SizedBox(width: 120),
                          Icon(
                            Icons.thermostat,
                            color: Colors.white,
                          ),
                          SizedBox(width: 10),
                          Text("Refrigerator",
                              style: TextStyle(
                                  fontWeight: FontWeight.normal, fontSize: 15)),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
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
