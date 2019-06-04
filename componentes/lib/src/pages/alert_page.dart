import 'package:flutter/material.dart';



class AlertPAge extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     appBar: AppBar(
       title: Text('Alert Page'),
     ),
     floatingActionButton: FloatingActionButton(
       child: Icon(Icons.ac_unit),
       onPressed: (){
         Navigator.pop(context);
       },
       ),
    );
  }
}