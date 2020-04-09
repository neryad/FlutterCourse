import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class ContadorPage extends StatefulWidget {
  @override
  createState() {
    return _ContadorPageState();
  }
}

class _ContadorPageState extends State<ContadorPage> {
  final _estiloTexto = new TextStyle(fontSize: 25);
  int _conteo = 10;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('StateFull'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text('Numeros de clicks:', style: _estiloTexto),
              Text('$_conteo', style: _estiloTexto),
            ],
          ),
        ),
        floatingActionButton: _crearbototnes());
  }

  Widget _crearbototnes() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget>[
        SizedBox(
          width: 30.0,
        ),
        FloatingActionButton(
            child: Icon(Icons.exposure_zero), onPressed: _reset),
        Expanded(child: SizedBox()),
        FloatingActionButton(child: Icon(Icons.remove), onPressed: _menos),
        SizedBox(
          width: 5.0,
        ),
        FloatingActionButton(child: Icon(Icons.add), onPressed: _agregar),
      ],
    );
  }

  void _agregar() {
   setState(() {
     _conteo++;
   }); 
  }

  void _menos() {
     setState(() {
     _conteo--;
   }); 
  }

  void _reset() {
     setState(() {
     _conteo = 0;
   }); 
  }
}
