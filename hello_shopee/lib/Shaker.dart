import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter/services.dart';
import 'package:flutter_shake_plugin/flutter_shake_plugin.dart';

void main() => runApp(Shaker());

class Shaker extends StatefulWidget {
  @override
  _ShakerState createState() => _ShakerState();
}

class _ShakerState extends State<Shaker> {
  FlutterShakePlugin _shakePlugin;

  @override
  void initState() {
    super.initState();
    _shakePlugin = FlutterShakePlugin(
      onPhoneShaken: () {
        //do stuff on phone shake
        print("What's in the boot?");
      },
    )..startListening();
  }

  @override
  void dispose() {
    super.dispose();
    _shakePlugin.stopListening();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Shake that BOOT!'),
        ),
        body: new Image.network(
            "https://raw.githubusercontent.com/ShopeeUltraHackathon2021/GroupC5/master/hello_shopee/lib/src/boot_gif.gif?token=ALTN7VXEI3RMPX7WWUBNOJ3ACXXCW"),
      ),
    );
  }
}
