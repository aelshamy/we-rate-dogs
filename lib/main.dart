import 'package:flutter/material.dart';
import 'package:we_rate_dogs/dog_list.dart';
import 'package:we_rate_dogs/dog_model.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'We Rate Dogs',
      theme: ThemeData(brightness: Brightness.light),
      home: MyHomePage(title: 'We Rate Dogs'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var dogs = [
    Dog('Ruby', 'Portland, OR, USA',
        'Ruby is a very good girl. Yes: Fetch, loungin\'. No: Dogs who get on furniture.'),
    Dog('Rex', 'Seattle, WA, USA', 'Best in Show 1999'),
    Dog('Rod Stewart', 'Prague, CZ',
        'Star good boy on international snooze team.'),
    Dog('Herbert', 'Dallas, TX, USA', 'A Very Good Boy'),
    Dog('Buddy', 'North Pole, Earth', 'Self problaimed human lover.'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1.0,
        title: Text(widget.title),
        backgroundColor: Colors.amberAccent,
      ),
      body: Container(
        // Add box decoration
        decoration: BoxDecoration(
          gradient: LinearGradient(
            // Where the linear gradient begins and ends
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            // Add one stop for each color.
            // Stops should increase
            // from 0 to 1
            stops: [0.1, 0.5, 0.7, 0.9],
            colors: [
              // Colors are easy thanks to Flutter's
              // Colors class.
              Colors.amber[800],
              Colors.amber[700],
              Colors.amber[600],
              Colors.amber[400],
            ],
          ),
        ),
        padding: EdgeInsets.all(15.0),
        child: DogList(dogs),
      ),
    );
  }
}
