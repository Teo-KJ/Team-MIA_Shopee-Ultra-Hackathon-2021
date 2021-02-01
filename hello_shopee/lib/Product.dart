import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:hello_shopee/Scan.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';

void main() => runApp(Product());

Future<Album> fetchProduct(itemId, shopId) async {
  String BASEURL = "https://api.hackathon2021.shopee.sg";
  String BASE_TOKEN_URL =
      BASEURL + "/item/get_info?item_id=" + itemId + "&shop_id=" + shopId;

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
    var item = Album.fromJson(data["data"]);
    return item;
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

class Product extends StatelessWidget {
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
  Future<Album> futureAlbum;

  @override
  void initState() {
    super.initState();
    //Link keyword to whatever searched in search bar
    String itemId = 1586756551.toString();
    String shopId = 92520461.toString();
    futureAlbum = fetchProduct(itemId, shopId);
  }

  File _image;
  Future getImage(bool isCamera) async {
    File image;

    if (isCamera) {
      image = await ImagePicker.pickImage(source: ImageSource.camera);
    }

    setState(() {
      _image = image;
    });
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
          body: Column(
        children: <Widget>[
          FlatButton(
            onPressed: () {
              print('I got clicked');
            },
            child: FittedBox(
                fit: BoxFit.contain, // otherwise the logo will be tiny
                child: FutureBuilder<Album>(
                    future: futureAlbum,
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        var item = snapshot.data;
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
                child: FutureBuilder<Album>(
                    future: futureAlbum,
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        var item = snapshot.data;
                        return Text(item.name, style: TextStyle(fontSize: 20));
                      } else if (snapshot.hasError) {
                        return Text("${snapshot.error}");
                      }
                      return Text("${snapshot.error}");
                    })),
          ),
          Center(
            child: FittedBox(
                fit: BoxFit.contain, // otherwise the logo will be tiny
                child: FutureBuilder<Album>(
                    future: futureAlbum,
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        var item = snapshot.data;
                        return Text("\$" + item.price.toString());
                      } else if (snapshot.hasError) {
                        return Text("${snapshot.error}");
                      }
                      return Text("${snapshot.error}");
                    })),
          ),
          Center(
            child: FittedBox(
                fit: BoxFit.contain, // otherwise the logo will be tiny
                child: FutureBuilder<Album>(
                    future: futureAlbum,
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        var item = snapshot.data;
                        return Text(item.stock.toString() +
                            " left " +
                            item.sold.toString() +
                            " sold");
                      } else if (snapshot.hasError) {
                        return Text("${snapshot.error}");
                      }
                      return Text("${snapshot.error}");
                    })),
          ),
          Center(
            child: FittedBox(
                fit: BoxFit.contain, // otherwise the logo will be tiny
                child: FutureBuilder<Album>(
                    future: futureAlbum,
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        var item = snapshot.data;
                        return Text("Rating: " + item.rating.toString());
                      } else if (snapshot.hasError) {
                        return Text("${snapshot.error}");
                      }
                      return Text("${snapshot.error}");
                    })),
          ),
          FloatingActionButton(
            heroTag: "btn2",
            onPressed: () {
              getImage(true);
            },
            child: Icon(Icons.camera, color: Colors.deepOrange),
            backgroundColor: Colors.white,
          ),
        ],
      )),
    );
  }
}
