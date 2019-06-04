import 'package:flutter/material.dart';

class InputsPage extends StatefulWidget {

 @override
  _InputsPageState createState() => _InputsPageState();
}

class _InputsPageState extends State<InputsPage> {
  String _nombre;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Inputs de texto'),
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 10.0,vertical: 20.0),
        children: <Widget>[
          _crearInput(),
          Divider(),
          _crearPersona(),
                  ],
                ),
              );
            }
          
            _crearInput() {
              return TextField(
                //autofocus: true,
                textCapitalization: TextCapitalization.sentences,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20.0)
                  ),
                  counter: Text('Letras ${_nombre.length}'),
                  hintText: 'Nombre de la persona',
                  labelText: 'Nombre2',
                  helperText: 'Solo es el nombre',
                  suffixIcon: Icon (Icons.accessibility),
                  icon: Icon(Icons.account_circle)
                ),
                onChanged: (valor){
                  _nombre = valor;
                
                  setState(() {
                     _nombre = valor;
                  });
                },
              );
            }

            Widget _crearPersona(){
              return ListTile(
                title: Text('Nombre es: $_nombre') ,
              );
            }
}