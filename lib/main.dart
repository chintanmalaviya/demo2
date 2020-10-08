import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: MyApp(),
  ));
}

class MyApp extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return MyAppState();
  }
}

class MyAppState extends State<MyApp>{

  final _rng = Random();
  double _width = 100;
  double _height = 100;
  Color _color = Colors.blue;
  double _radius = 8;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Animated Container"),
      ),
      body: Center(
        child: Column(
          children: [
            AnimatedContainer(
              duration: Duration(seconds: 1),
              width: _width,
              height: _height,
              margin: EdgeInsets.all(8.0),
              child: FlutterLogo(),
              decoration: BoxDecoration(
                color: _color,
                borderRadius: BorderRadius.circular(_radius),
              ),
              curve: Curves.fastOutSlowIn,
            ),
            RaisedButton.icon(
              icon: Icon(Icons.update),
              label: Text("Update Random Container"),
              onPressed: (){
                setState(() {
                  _width = _rng.nextInt(100).toDouble();
                  _height = _rng.nextInt(100).toDouble();
                  _radius = _rng.nextInt(50).toDouble();
                  _color = Color.fromRGBO(_rng.nextInt(256), _rng.nextInt(256), _rng.nextInt(256), 1);
                });
              },
            )
          ],
        ),
      ),
    );
  }
}

