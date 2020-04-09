
import 'package:contador/src/Pages/contador_page.dart';
// import 'package:contador/src/Pages/home_page.dart';
import 'package:flutter/material.dart';

class MyApp extends StatelessWidget{  

  @override
  Widget build( context ) {

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home:Center(
        child: ContadorPage(),
        // child: HomePage(),
      ),
      
    );
  }
}