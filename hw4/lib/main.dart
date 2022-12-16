import 'package:flutter/material.dart';

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
        leading: const IconButton(onPressed: null, icon: Icon(Icons.arrow_back_ios , color: Colors.pinkAccent ,),),
        centerTitle: true,
        title: Text(widget.title),
        actions: [IconButton(onPressed: null, icon: Icon(Icons.ios_share_rounded)),
        IconButton(onPressed: null, icon: Icon(Icons.favorite_border_outlined))],
        
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "Aja Ae",
              style: Theme.of(context).textTheme.displayMedium,
            ),
            const Image(
          image: NetworkImage("https://www.techhub.in.th/wp-content/uploads/2021/05/5616.jpg"),
        ),
          ],
        ),
      ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: _loginUser,
      //   tooltip: 'login',
      //   child: const Icon(Icons.login),
      // ),
      bottomNavigationBar: BottomNavigationBar( items : const [BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'), 
      BottomNavigationBarItem(icon:Icon(Icons.school), label: "School")],),
    );
  }
}
