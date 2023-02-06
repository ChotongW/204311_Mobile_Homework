import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/services.dart';
import 'firebase_options.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:csv/csv.dart';
import 'dart:async' show Future;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
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
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Address Form'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _formKey = GlobalKey<FormState>();
  DatabaseReference ref = FirebaseDatabase.instance.ref("users/123");

  var districts = <String>[];
  var tambons = <String>[];
  late String selected_dis;
  late String selected_tam;
  bool validateEmail(String value) {
    String pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = new RegExp(pattern);
    return (!regex.hasMatch(value)) ? false : true;
  }

  Future<void> fetchDistrict() async {
    // final String myData = await rootBundle.loadString("tambon_chiangmai.csv");
    // List<String> csvTable = CsvToListConverter().convert(myData).cast<String>();
    final rawData = await rootBundle.loadString("assets/tambon_chiangmai.csv");
    List listData = const CsvToListConverter().convert(rawData);

    // print(listData.runtimeType);
    // print(listData);
    setState(() {
      for (var i = 1; i < listData.length; i++) {
        if (!districts.contains(listData[i][1])) {
          districts.add(listData[i][1]);
        }
      }
      //print(districts);
      // districts = listData;
    });
  }

  @override
  void initState() {
    super.initState();
    fetchDistrict();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Center(child: Text(widget.title)),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Form(
              key: _formKey,
              child: Column(
                children: <Widget>[
                  TextFormField(
// The validator receives the text that the user has entered.
                    decoration: const InputDecoration(
                      border: UnderlineInputBorder(),
                      labelText: 'Enter Email Address',
                    ),

                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please write your Email';
                      }
                      if (!validateEmail(value)) {
                        return "Invalid Email Format";
                      }
                      return null;
                    },
                  ),
                  TextFormField(
// The validator receives the text that the user has entered.
                    decoration: const InputDecoration(
                      border: UnderlineInputBorder(),
                      labelText: 'Enter Zip Code',
                    ),

                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please write your zip code';
                      }
                      if (value.length != 5) {
                        return 'Invalid Zip Code Format';
                      }
                      return null;
                    },
                  ),
                  Container(
                      alignment: Alignment.centerLeft,
                      child: Row(children: [
                        Text(
                            style: TextStyle(
                              fontSize: 30,
                            ),
                            textAlign: TextAlign.left,
                            "Province: "),
                        Text("Chiang Mai",
                            style: TextStyle(
                              fontSize: 20,
                            ),
                            textAlign: TextAlign.left),
                      ])),
                  Container(
                    alignment: Alignment.centerLeft,
                    child: Text(
                        style: TextStyle(fontSize: 30),
                        textAlign: TextAlign.left,
                        "District"),
                  ),
                  Autocomplete<String>(
                    optionsBuilder: (TextEditingValue textEditingValue) {
                      if (textEditingValue.text == '') {
                        return const Iterable<String>.empty();
                      } else {
                        return districts.where((String option) {
                          return option
                              .toLowerCase()
                              .contains(textEditingValue.text.toLowerCase());
                        });
                      }
                    },
                    onSelected: (String selection) {
                      selected_dis = selection;
                    },
                  ),
                  Container(
                    alignment: Alignment.centerLeft,
                    child: Text(
                        style: TextStyle(fontSize: 30),
                        textAlign: TextAlign.left,
                        "Tambon"),
                  ),
                  Autocomplete<String>(
                    optionsBuilder: (TextEditingValue textEditingValue) {
                      if (textEditingValue.text == '') {
                        return const Iterable<String>.empty();
                      } else {
                        return tambons.where((String option) {
                          return option
                              .toLowerCase()
                              .contains(textEditingValue.text.toLowerCase());
                        });
                      }
                    },
                    onSelected: (String selection) {
                      selected_dis = selection;
                    },
                  ),
                  ElevatedButton(
                    onPressed: () async {
// Validate returns true if the form is valid, or false otherwise.
                      if (_formKey.currentState!.validate()) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Processing Data')),
                        );
                        await ref.set({
                          "name": "wasin",
                          "age": 21,
                          "address": {"line1": "100 Mountain View"}
                        });
                      }
                    },
                    child: const Text('Submit'),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
