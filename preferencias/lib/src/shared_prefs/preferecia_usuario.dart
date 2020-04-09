import 'package:shared_preferences/shared_preferences.dart';

class PreferenciaUsuario {
  static final PreferenciaUsuario _instacia =
      new PreferenciaUsuario._internal();

  factory PreferenciaUsuario() {
    return _instacia;
  }

  PreferenciaUsuario._internal();

  SharedPreferences _prefs;

  initPrefs() async  {
    this._prefs = await SharedPreferences.getInstance();
  }

  //Get & set Generos
  get genero {
    return _prefs.getInt('genero') ?? 1;
  }

  set genero ( int value ) {
    _prefs.setInt('genero', value);
  }

   //Get & set Color
  get colorSecundario {
    return _prefs.getBool('colorSecundario') ?? false;
  }

  set colorSecundario ( bool value ) {
    _prefs.setBool('colorSecundario', value);
  }


    //Get & set nombreUsuario
  get nombreUsuario {
    return _prefs.getString('nombreUsuario') ?? '';
  }

  set nombreUsuario ( String value ) {
    _prefs.setString('nombreUsuario', value);
  }


   //Get & set nombreUsuario
  get ultimaPagina {
    return _prefs.getString('ultimaPagina') ?? 'home';
  }

  set ultimaPagina ( String value ) {
    _prefs.setString('ultimaPagina', value);
  }




}
