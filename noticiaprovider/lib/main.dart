import 'package:flutter/material.dart';
import 'package:noticiaprovider/src/pages/tabs_page.dart';
import 'package:noticiaprovider/src/services/news_services.dart';
import 'package:noticiaprovider/src/theme/tema.dart';
import 'package:provider/provider.dart';
 
void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [

        ChangeNotifierProvider(create: (_) => new  NewService(),)
      ],
          child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Material App',
        theme: miTema,
        home: TabsPage()
      ),
    );
  }
} 