import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:hello_shopee/Product.dart';
import 'package:http/http.dart' as http;

void main() => runApp(ProductListing());

Future<List> fetchAlbum(keyword) async {
  String BASEURL = "https://api.hackathon2021.shopee.sg";
  String BASE_TOKEN_URL = BASEURL + "/item/search?keyword=" + keyword;

  final response = await http.get(BASE_TOKEN_URL,
      //Authentication token
      headers: {
        HttpHeaders.authorizationHeader: "YSmUdKDR2UzWreoQtkb2",
        'X-Hackathon-Token': "YSmUdKDR2UzWreoQtkb2"
      });

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    var data = jsonDecode(response.body);
    //debugPrint(response.body);
    var items = data["data"]["items"];
    var itemsList = [];
    for (var i = 0; i < items.length; i++) {
      itemsList.add(Album.fromJson(items[i]));
    }
    return itemsList;
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load album');
  }
}

class Album {
  final String name;
  final int itemId;
  final int shopId;
  final double price;
  final int stock;
  final int sold;
  final double rating;
  final String cover;

  Album(
      {this.name,
      this.itemId,
      this.shopId,
      this.price,
      this.stock,
      this.sold,
      this.rating,
      this.cover});

  factory Album.fromJson(Map<String, dynamic> json) {
    return Album(
        name: json['name'],
        itemId: json['item_id'],
        shopId: json['shop_id'],
        price: json['price'].toDouble(),
        stock: json['stock'],
        sold: json['sold'],
        rating: json['rating'].toDouble(),
        cover: json['cover']);
  }
}

class ProductListing extends StatelessWidget {
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
  Future<List> futureAlbum;

  @override
  void initState() {
    super.initState();
    //Link keyword to whatever searched in search bar
    String keyword = "cat";
    futureAlbum = fetchAlbum(keyword);
  }

  @override
  Widget build(BuildContext context) {
    const TextStyle h1 = TextStyle(
        fontSize: 100, fontFamily: 'Roboto', fontWeight: FontWeight.bold);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        body: GridView.count(
          // Create a grid with 2 columns. If you change the scrollDirection to
          // horizontal, this produces 2 rows.
          crossAxisCount: 2,
          // Generate 100 widgets that display their index in the List.
          children: List.generate(10, (index) {
            return Column(
              children: <Widget>[
                FlatButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Product()),
                    );
                  },
                  child: FittedBox(
                      fit: BoxFit.contain, // otherwise the logo will be tiny
                      child: FutureBuilder<List>(
                          future: futureAlbum,
                          builder: (context, snapshot) {
                            if (snapshot.hasData) {
                              var items = snapshot.data;
                              var item = items[index];
                              return Image.network(item.cover);
                            } else if (snapshot.hasError) {
                              return Text("${snapshot.error}");
                            }
                            return Text("${snapshot.error}");
                          })),
                ),
                Padding(padding: EdgeInsets.all(5.0)),
                Center(
                  child: FittedBox(
                      fit: BoxFit.contain, // otherwise the logo will be tiny
                      child: FutureBuilder<List>(
                          future: futureAlbum,
                          builder: (context, snapshot) {
                            if (snapshot.hasData) {
                              var items = snapshot.data;
                              var item = items[index];
                              return Text(item.name, style: h1);
                            } else if (snapshot.hasError) {
                              return Text("${snapshot.error}");
                            }
                            return Text("${snapshot.error}");
                          })),
                )
              ],
            );
          }),
        ),
      ),
    );
  }
}
