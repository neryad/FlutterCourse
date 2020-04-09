import 'package:componetes/src/pages/alert_page.dart';
import 'package:componetes/src/routes/routes.dart';
// import 'package:componetes/src/pages/home_temp.dart';
import 'package:flutter/material.dart';
 
void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      debugShowCheckedModeBanner: false,
      // home: HomePage()
      initialRoute: '/',
      routes: getApplicationsRoutes(),
      onGenerateRoute: (setting) {
        return MaterialPageRoute(
          builder: (BuildContext context ) => AlertPage()
        );
      },
    );
  }
}