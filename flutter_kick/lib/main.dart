import 'package:flutter/material.dart';
import 'HomePage.dart';

void main() => runApp(MyApp());

/// This is the main application widget.
class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Team-KHUNJ",
      debugShowCheckedModeBanner: false,
      home: Main(),
      theme: ThemeData(
        primarySwatch: Colors.deepOrange,
      ),
    );
  }
}

/// This is the stateful widget that the main application instantiates.
class Main  extends StatefulWidget {
  Main ({Key key}) : super(key: key);

  @override
  _MyStatefulWidgetState createState() => _MyStatefulWidgetState();
}

/// This is the private State class that goes with MyStatefulWidget.
class _MyStatefulWidgetState extends State<Main> {
  int _selectedIndex = 2;
  static const TextStyle optionStyle = TextStyle(fontSize: 30);

  List<Widget> _widgetOptions = <Widget>[
    Text(
      'Can be some feature here',
      style: optionStyle,
      textAlign: TextAlign.center,
    ),
    Text(
      'Here can be the Mini Instagram',
      style: optionStyle,
      textAlign: TextAlign.center,
    ),
    HomePage(),
    Text(
      'Can be another feature here',
      style: optionStyle,
      textAlign: TextAlign.center,
    ),
    Text(
      'An another feature here',
      style: optionStyle,
      textAlign: TextAlign.center,
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Hello Shopee'),
      ),

      drawer: Drawer(
        child: ListView(
            padding: EdgeInsets.zero,
            children: const <Widget>[
              DrawerHeader(
                decoration: BoxDecoration(
                  color: Colors.orange,
                ),
                child: Text(
                  'The Hamburger here',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                  ),
                ),
              ),

              ListTile(
                leading: Icon(Icons.account_circle),
                title: Text('Profile'),
              ),

              ListTile(
                leading: Icon(Icons.message),
                title: Text('Messages'),
              ),

              ListTile(
                leading: Icon(Icons.settings),
                title: Text('Settings'),
              ),
            ]
        ),
      ),

      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),

      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.info),
            label: 'Unnamed',
          ),

          BottomNavigationBarItem(
            icon: Icon(Icons.tv),
            label: 'Instagram',
          ),

          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),

          BottomNavigationBarItem(
            icon: Icon(Icons.face),
            label: 'Unnamed',
          ),

          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Unnamed',
          ),
        ],

        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        unselectedItemColor: Colors.grey,
        onTap: _onItemTapped,

      ),
    );
  }
}
