import 'package:flutter/material.dart';

bool isNum(String s) {
  if (s.isEmpty) return false;

  final n = num.tryParse(s);

  return ( n == null )? false : true;
}

void mostrarAlerta(BuildContext context, String msg) {

  showDialog(
    context: context,
    builder: (context) {

      return AlertDialog(
        title: Text('Informacion'),
        content: Text(msg),
        actions: <Widget>[
          FlatButton(onPressed: ()=> Navigator.of(context).pop() , child: Text('ok'))
        ],
      );
    },
  );
}