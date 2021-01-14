import 'package:flutter/material.dart';

void main() => runApp(HomePage());

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyStatefulWidget(),
    );
  }
}

class MyStatefulWidget extends StatefulWidget {
  MyStatefulWidget({Key key}) : super(key: key);
  
  @override
  _MyStatefulWidgetState createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  static const TextStyle h1 = TextStyle(fontSize: 20, fontFamily: 'Roboto', fontWeight: FontWeight.bold),
                         h2 = TextStyle(fontSize: 40, fontFamily: 'Roboto');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(children: <Widget>[
          Padding(padding: EdgeInsets.all(5.0)),
          Text(
            'Welcome User!',
            style: h1,
          ),

          Padding(padding: EdgeInsets.all(5.0)),

          Row(children: [
            Padding(padding: EdgeInsets.all(10.0)),
            FloatingActionButton(
              onPressed: () {
                // Add your onPressed code here!
              },
              child: Icon(Icons.navigation),
              backgroundColor: Colors.green,
            ),

            Padding(padding: EdgeInsets.all(10.0)),
            FloatingActionButton(
              onPressed: () {
                // Add your onPressed code here!
              },
              child: Icon(Icons.add),
              backgroundColor: Colors.green,
            ),
          ],
          ),

          Padding(padding: EdgeInsets.all(10.0)),
          Text(
            'So here will be whatever you want to put!',
            style: h2,
            textAlign: TextAlign.center,
          ),
        ],
        )
    );
  }
  
}