import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:componentes/src/pages/alert_page.dart';
import 'package:componentes/src/routes/routes.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Componentes App',
      debugShowCheckedModeBanner: false,
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: [
        const Locale('en'), // English
        const Locale('es'), // Hebrew
        const Locale('zh'), // Chinese
      ],
      // home: HomePAge(),
      initialRoute: '/',
      routes: getAplicationsRoutes(),
      onGenerateRoute: (RouteSettings settings) {
        print('Ruta llmada: ${settings.name}');

        return MaterialPageRoute(
            builder: (BuildContext context) => AlertPAge());
      },
    );
  }
}
