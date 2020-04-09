import 'package:flutter/material.dart';

class InputPage extends StatefulWidget {
  InputPage({Key key}) : super(key: key);

  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  String _nombre;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Inptus de texto'),
      ),
      body: ListView(
          padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
          children: <Widget>[
            _creaInput(),
            Divider(),
            _crearPersona()
            ]
          ),
    );
  }

  Widget _creaInput() {
    return TextField(
      // autofocus: true,
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20.0)
            ),
          counter: Text('letras 0'),
          hintText: 'Nombre de la persona',
          labelText: 'Nombre',
          helperText: 'solo nombre',
          suffixIcon: Icon(Icons.accessibility),
          icon: Icon(Icons.account_circle)
      ),
      onChanged: (valor){
        _nombre = valor;
      },
    );
  }

 Widget _crearPersona() {
   return ListTile(
     title: Text('Nombre es: $_nombre'),
   );
 }
}
