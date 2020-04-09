import 'package:flutter/material.dart';

class BasicoPage extends StatelessWidget {
  final stiloTitulo = TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold);
  final stiloSubTitulo = TextStyle(fontSize: 18.0, color: Colors.grey);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
          _crearImagen(),
          _crearTitulo(),
          _crearacciones(),
          _creartexto(),
          _creartexto(),
          _creartexto(),
          _creartexto(),
          _creartexto(),
        ],
        ),
      ),
    );
  }

  Widget _crearImagen() {
    return Container(
      child: Image(
        image: NetworkImage(
            'https://www.yourtrainingedge.com/wp-content/uploads/2019/05/background-calm-clouds-747964.jpg'),
      height: 200.0,
      fit: BoxFit.cover,
      ),
    );
  }

  Widget _crearTitulo() {
    return SafeArea(
          child: Container(
        padding: EdgeInsets.symmetric(horizontal: 30.0, vertical: 20.0),
        child: Row(
          children: <Widget>[
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'Person sit',
                    style: stiloTitulo,
                  ),
                  SizedBox(
                    height: 7.0,
                  ),
                  Text(
                    'Beautiful view betwen montains',
                    style: stiloSubTitulo,
                  ),
                ],
              ),
            ),
            Icon(Icons.star, color: Colors.red, size: 30.0),
            Text('41', style: TextStyle(fontSize: 20.0))
          ],
        ),
      ),
    );
  }

  Widget _crearacciones() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        _action(Icons.call, 'Call'),
        _action(Icons.near_me, 'Route'),
        _action(Icons.share, 'Share'),
        
      ],
    );
  }

  Widget _action(IconData icon, String texto) {
    return Column(
      children: <Widget>[
        Icon(
          icon,
          color: Colors.blue,
          size: 40.0,
        ),
        SizedBox(height: 10.0),
        Text(
          texto,
          style: TextStyle(fontSize: 15.0, color: Colors.blue),
        )
      ],
    );
  }

  Widget _creartexto() {
    return SafeArea(
          child: Container(
        padding: EdgeInsets.symmetric(horizontal:40.0, vertical:20.0),
        child: Text(
            'Nulla aliqua laborum adipisicing elit laborum culpa anim duis. Cillum esse quis ut incididunt cillum exercitation id et aute aute et non. Ut dolore sunt excepteur amet dolor occaecat. Labore ut aliquip quis nostrud culpa.',
            textAlign: TextAlign.justify,),
      ),
    );
  }
}
