import 'package:flutter/material.dart';
import 'package:noticiaprovider/src/services/news_services.dart';
import 'package:noticiaprovider/src/widgets/lista_noticas.dart';
import 'package:provider/provider.dart';

class Tab1Page extends StatefulWidget {
  @override
  _Tab1PageState createState() => _Tab1PageState();
}

class _Tab1PageState extends State<Tab1Page> with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    //   final newsServices = Provider.of<NewService>(context);

    final headlines = Provider.of<NewService>(context).headlines;

    return Scaffold(
      body: (headlines.length == 0)
          ? Center(
              child: CircularProgressIndicator(),
            )
          : ListaNoticia(headlines),
    );
  }

  @override

  bool get wantKeepAlive => true;
}
