import 'package:flutter/material.dart';
import 'package:preferencias/src/pages/home.dart';
import 'package:preferencias/src/pages/settings.dart';
import 'package:preferencias/src/shared_prefs/preferecia_usuario.dart';
 
void main() async  {
  WidgetsFlutterBinding.ensureInitialized();
  final prefs = new PreferenciaUsuario();
  await prefs.initPrefs();

  runApp(MyApp());
//   final prefs = new PreferenciaUsuario();
//   await prefs.initPrefs();
//   runApp(MyApp());
 }
 
class MyApp extends StatelessWidget {
  final prefs = new PreferenciaUsuario();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Preferencias',
     initialRoute: prefs.ultimaPagina,
     routes: {
       HomePage.routeName: (BuildContext context) => HomePage(),
      SettingPage.routeName: (BuildContext context) => SettingPage(),
     },
    );
  }
}