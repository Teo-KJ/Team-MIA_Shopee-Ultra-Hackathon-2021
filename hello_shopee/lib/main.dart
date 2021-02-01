import 'package:flutter/material.dart';
import 'package:hello_shopee/SearchFunction.dart';
import 'HomePage.dart';
import 'Scan.dart';

void main() => runApp(MyApp());

/// This is the main application widget.
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Team MIA: Hallo Shopee",
      debugShowCheckedModeBanner: false,
      home: Main(),
      theme: ThemeData(
        primarySwatch: Colors.deepOrange,
      ),
    );
  }
}

/// This is the stateful widget that the main application instantiates.
class Main extends StatefulWidget {
  Main({Key key}) : super(key: key);

  @override
  _MyStatefulWidgetState createState() => _MyStatefulWidgetState();
}

/// This is the private State class that goes with MyStatefulWidget.
class _MyStatefulWidgetState extends State<Main> {
  int _selectedIndex = 2;
  static const TextStyle optionStyle = TextStyle(fontSize: 30);

  List<Widget> _widgetOptions = <Widget>[
    // TakePictureScreen(camera: null),
    Text(
      'Scan Feature',
      style: optionStyle,
      textAlign: TextAlign.center,
    ),
    Text(
      'Some Feature',
      style: optionStyle,
      textAlign: TextAlign.center,
    ),
    HomePage(),
    Text(
      'Some feature here',
      style: optionStyle,
      textAlign: TextAlign.center,
    ),
    Text(
      'Some feature here',
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
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            tooltip: 'Search',
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SearchFunction()),
              );
            },
          ),
          IconButton(
            icon: Icon(Icons.shopping_cart_rounded),
            tooltip: 'Cart',
            onPressed: () {},
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(padding: EdgeInsets.zero, children: const <Widget>[
          DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.orange,
            ),
            child: Text(
              'User',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
              ),
            ),
          ),
          ListTile(
            leading: IconButton(
              icon: Icon(Icons.account_circle),
            ),
            title: Text('Profile'),
          ),
          ListTile(
            leading: IconButton(
              icon: Icon(Icons.messenger),
            ),
            title: Text('My Messages'),
          ),
          ListTile(
            leading: IconButton(
              icon: Icon(Icons.shopping_bag),
            ),
            title: Text('My Purchases'),
          ),
          ListTile(
            leading: IconButton(
              icon: Icon(Icons.lightbulb),
            ),
            title: Text('My Rewards'),
          ),
          ListTile(
            leading: IconButton(
              icon: Icon(Icons.favorite),
            ),
            title: Text('My Favourites'),
          ),
        ]),
      ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.qr_code_scanner),
            label: 'Scan',
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
