import 'package:flutter/material.dart';


class HomePage extends StatelessWidget {

  final estiloTexto = new TextStyle (fontSize: 25);
  final int conteo = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Titulo') ,
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center ,
          children: <Widget>[
            Text('Numero de clicks:',style: estiloTexto),
            Text('$conteo',style: estiloTexto),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        
        child: Icon(Icons.add) ,
        onPressed: (){
          print('hola wawaw');
          // conteo  = conteo + 1;
        },
      ),
    );
  }
}
