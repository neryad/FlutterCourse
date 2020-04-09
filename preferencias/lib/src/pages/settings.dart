import 'package:flutter/material.dart';
import 'package:preferencias/src/shared_prefs/preferecia_usuario.dart';
import 'package:preferencias/src/widgets/menu_widget.dart';


class SettingPage extends StatefulWidget {
  static String routeName = 'settingd';

  @override
  _SettingPageState createState() => _SettingPageState();

}

class _SettingPageState extends State<SettingPage> {
  bool _colorSecundario;
  int _genero;
  String _nombre;

  TextEditingController _editingController;
   final prefs = new PreferenciaUsuario();

  @override
  void initState() {
    super.initState();
    _editingController = new TextEditingController(text: prefs.nombreUsuario);
    prefs.ultimaPagina = SettingPage.routeName;
    _genero = prefs.genero;
    _colorSecundario = prefs.colorSecundario;
  }



   _setSelectRadio( int valor)  {
    
     setState(() {
          prefs.genero = valor;
          _genero = valor;
      });
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Prferencias de Usuarios'),
         backgroundColor: (prefs.colorSecundario) ? Colors.teal : Colors.blue,
      ),
      drawer: MenuWidget(),
      body: ListView(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(10.0),
            child: Text(
              'Settings',
              style: TextStyle(fontSize: 45.0, fontWeight: FontWeight.bold),
            ),
          ),
          Divider(),
          SwitchListTile(
              value: _colorSecundario,
              title: Text('Color secundario'),
              onChanged: (value) {
                setState(() {
                   _colorSecundario = value;
                   prefs.colorSecundario = value;
                });
              }),
          RadioListTile(
            value: 1,
            title: Text('Masculino'),
            groupValue: _genero,
            onChanged: _setSelectRadio,
          ),
          RadioListTile(
            value: 2,
            title: Text('Femenino'),
            groupValue: _genero,
            onChanged: _setSelectRadio,
          ),
          Divider(),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            child: TextField(
              controller: _editingController,
              decoration: InputDecoration(
                labelText: 'Nombre',
                helperText: 'Nombre del dueño del equipo',
              ),
              onChanged: (value) {
                _nombre = value;
                prefs.nombreUsuario = value;
              },
            ),
          ),
        ],
      ),
    );
  }



  
}
