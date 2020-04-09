import 'dart:math';

import 'package:flutter/material.dart';

class AnimatedContainerPage extends StatefulWidget {
  @override
  _AnimatedContainerPageState createState() => _AnimatedContainerPageState();
}

class _AnimatedContainerPageState extends State<AnimatedContainerPage> {
  double _width = 50.0;
  double _heiht = 50.0;
  Color _color = Colors.pink;

  BorderRadiusGeometry _borderRadiusGeometry = BorderRadius.circular(8.0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Aniamted Container'),
      ),
      body: Center(
        child: AnimatedContainer(
          duration: Duration(seconds: 1),
          curve: Curves.fastOutSlowIn,
          width: _width,
          height: _heiht,
          decoration: 
          BoxDecoration(
            borderRadius: _borderRadiusGeometry,
            color: _color,
          ),

        ),
      ),

      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.play_arrow),
        onPressed: _cambiarforma,
              ),
            );
          }
        
          void _cambiarforma() {
            final radom = Random();
            setState(() {
            _width = radom.nextInt(300).toDouble();
            _heiht = radom.nextInt(300).toDouble();
            _color = Color.fromRGBO(
              radom.nextInt(255),
              radom.nextInt(255),
             radom.nextInt(255),
              1);
              _borderRadiusGeometry = BorderRadius.circular(radom.nextInt(100).toDouble());
            });

  }
}