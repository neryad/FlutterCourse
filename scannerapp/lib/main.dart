import 'package:flutter/material.dart';
import 'package:scannerapp/src/pages/home_page.dart';
import 'package:scannerapp/src/pages/mapas_page.dart';
 
void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'QReader',
      initialRoute: 'home',
      routes: {
        'home' : (BuildContext context) => HomePage(),
        'mapa' : (BuildContext context) => MapasPage(),
      },
      theme: ThemeData(
        primaryColor: Colors.deepPurple

      ),
    );
  }
}