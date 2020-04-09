import 'package:flutter/material.dart';
import 'package:preferencias/src/shared_prefs/preferecia_usuario.dart';
import 'package:preferencias/src/widgets/menu_widget.dart';

class HomePage extends StatelessWidget {
 
 static String routeName = 'home';
  final prefs = new PreferenciaUsuario();

  @override
  Widget build(BuildContext context) {
     prefs.ultimaPagina = HomePage.routeName;
    return Scaffold(
      appBar: AppBar(
        title:Text('Prferencias de Usuarios'),
        backgroundColor: (prefs.colorSecundario) ? Colors.teal : Colors.blue,
      ),
      drawer: MenuWidget(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text('Color secundario : ${prefs.colorSecundario}'),
          Divider(),
           Text('Genero : ${prefs.genero}'),
          Divider(),
           Text('Nombre usurio : ${prefs.nombreUsuario}'),
          Divider(),
          
        ],
      ),
    );
  }



}