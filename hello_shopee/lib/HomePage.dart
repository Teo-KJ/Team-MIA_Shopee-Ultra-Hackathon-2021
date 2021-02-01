import 'package:flutter/material.dart';
import 'package:hello_shopee/ProductListing.dart';
import 'package:hello_shopee/app_icons.dart';

import 'Scan.dart';
import 'Shaker.dart';
// import 'ArCoreView.dart';

void main() => runApp(HomePage());

class OpenPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var paint1 = Paint()
      ..color = Color(0xff995588)
      ..style = PaintingStyle.fill;
    canvas.drawRect(Offset(0, 0) & const Size(350, 200), paint1);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}

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
  static const TextStyle h1 = TextStyle(
          fontSize: 25, fontFamily: 'Roboto', fontWeight: FontWeight.bold),
      h2 = TextStyle(fontSize: 20, fontFamily: 'Roboto');
  static const Color buttonColors = Colors.white, insideOfButton = Colors.black;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: const EdgeInsets.all(8),
        children: <Widget>[
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              ' Welcome User!',
              style: h1,
              textAlign: TextAlign.left,
            ),
          ),
          Padding(padding: EdgeInsets.all(5.0)),
          Row(
            children: [
              FloatingActionButton(
                heroTag: "btn1",
                onPressed: () {
                  // Add your onPressed code here!
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ProductListing()),
                  );
                },
                child: Icon(
                  Icons.shopping_basket_rounded,
                  color: insideOfButton,
                ),
                backgroundColor: buttonColors,
              ),
              Padding(padding: EdgeInsets.all(10.0)),
              FloatingActionButton(
                heroTag: "btn2",
                onPressed: () {
                  // Add your onPressed code here!
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(builder: (context) => Scan();),
                  // );
                },
                child: Icon(
                  Icons.camera,
                  color: insideOfButton,
                ),
                backgroundColor: buttonColors,
              ),
              Padding(padding: EdgeInsets.all(10.0)),
              FloatingActionButton(
                heroTag: "btn3",
                onPressed: () {
                  // Add your onPressed code here!
                },
                child: Icon(
                  Icons.brunch_dining,
                  color: insideOfButton,
                ),
                backgroundColor: buttonColors,
              ),
              Padding(padding: EdgeInsets.all(10.0)),
              FloatingActionButton(
                heroTag: "btn4",
                onPressed: () {
                  // Add your onPressed code here!
                },
                child: Icon(
                  Icons.attach_money,
                  color: insideOfButton,
                ),
                backgroundColor: buttonColors,
              ),
            ],
            mainAxisAlignment: MainAxisAlignment.center,
          ),
          Padding(padding: EdgeInsets.all(5.0)),
          Row(
            children: [
              FloatingActionButton(
                heroTag: "btn5",
                onPressed: () {
                  // Add your onPressed code here!
                },
                child: Icon(
                  Icons.camera_roll_sharp,
                  color: insideOfButton,
                ),
                backgroundColor: buttonColors,
              ),
              Padding(padding: EdgeInsets.all(10.0)),
              FloatingActionButton(
                heroTag: "btn6",
                onPressed: () {
                  // Add your onPressed code here!
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Shaker()),
                  );
                },
                child: Icon(
                  Icons.card_giftcard,
                  color: insideOfButton,
                ),
                backgroundColor: buttonColors,
              ),
              Padding(padding: EdgeInsets.all(10.0)),
              FloatingActionButton(
                heroTag: "btn7",
                onPressed: () {
                  // Add your onPressed code here!
                },
                child: Icon(
                  Icons.tv,
                  color: insideOfButton,
                ),
                backgroundColor: buttonColors,
              ),
              Padding(padding: EdgeInsets.all(10.0)),
              FloatingActionButton(
                heroTag: "btn8",
                onPressed: () {
                  // Add your onPressed code here!
                },
                child: Icon(
                  Icons.more_horiz,
                  color: insideOfButton,
                ),
                backgroundColor: buttonColors,
              ),
            ],
            mainAxisAlignment: MainAxisAlignment.center,
          ),
          Padding(padding: EdgeInsets.all(10.0)),
          CustomPaint(
            painter: OpenPainter(),
          ),
          Padding(padding: EdgeInsets.all(110.0)),
          Text(
            "Featured",
            style: h2,
          ),
          Padding(padding: EdgeInsets.all(10.0)),
          Row(
            children: [
              Container(
                width: 80,
                height: 80,
                child: MaterialButton(
                  shape: CircleBorder(
                      side: BorderSide(
                          width: 2,
                          color: Colors.red,
                          style: BorderStyle.solid)),
                  child: Text("Vouchers",
                      style: TextStyle(fontSize: 11, fontFamily: 'Roboto')),
                  color: Colors.pinkAccent[100],
                  textColor: Colors.white,
                  onPressed: () {},
                ),
              ),
              Padding(padding: EdgeInsets.all(10.0)),
              Container(
                width: 80,
                height: 80,
                child: MaterialButton(
                  shape: CircleBorder(
                      side: BorderSide(
                          width: 2,
                          color: Colors.red,
                          style: BorderStyle.solid)),
                  child: Text("CNY"),
                  color: Colors.pinkAccent[100],
                  textColor: Colors.white,
                  onPressed: () {},
                ),
              ),
              Padding(padding: EdgeInsets.all(10.0)),
              Container(
                width: 80,
                height: 80,
                child: MaterialButton(
                  shape: CircleBorder(
                      side: BorderSide(
                          width: 2,
                          color: Colors.red,
                          style: BorderStyle.solid)),
                  child: Text(
                    "Top Products",
                    style: TextStyle(fontSize: 11, fontFamily: 'Roboto'),
                    textAlign: TextAlign.center,
                  ),
                  color: Colors.pinkAccent[100],
                  textColor: Colors.white,
                  onPressed: () {},
                ),
              ),
            ],
            mainAxisAlignment: MainAxisAlignment.center,
          ),
        ],
      ),
    );
  }
}
