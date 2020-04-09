import 'package:flutter/material.dart';


class HomePage extends StatelessWidget {
  
  final  estiloTexto = new TextStyle(fontSize: 25);
  final int conteo = 10;
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        title:Text('Titulo'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Numeros de clicks:',style: estiloTexto),
            Text('$conteo',style: estiloTexto),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          
        }
      ),
    );
  }
}