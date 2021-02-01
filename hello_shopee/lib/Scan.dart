import 'package:flutter/material.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';

void main() => runApp(Scan());

class Scan extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.deepOrange,
      ),
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

  static const TextStyle h1 = TextStyle(fontSize: 20, fontFamily: 'Roboto', fontWeight: FontWeight.bold);

  File _image;
  Future getImage(bool isCamera) async {
    File image;

    if (isCamera){
      image = await ImagePicker.pickImage(source: ImageSource.camera);
    }

    setState((){
      _image = image;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body:
        Column(children: <Widget>[
          Padding(padding: EdgeInsets.all(5.0)),
          
          Align(
            alignment: Alignment.centerLeft,
            child: Text('Take a picture', style: h1, textAlign: TextAlign.left,),
          ),

          Padding(padding: EdgeInsets.all(5.0)),

          FloatingActionButton(
            child: Icon(Icons.camera_alt),
            // Provide an onPressed callback.
            onPressed: () async {
              getImage(true);
            },
            backgroundColor: Colors.orange,
          ),

          _image == null ? Container() : Image.file(_image, height: 300, width: 300,)
          ]
        )
    );
  }

}