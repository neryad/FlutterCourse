import 'package:flutter/material.dart';
import 'package:noticiaprovider/src/models/category_model.dart';
import 'package:noticiaprovider/src/services/news_services.dart';
import 'package:noticiaprovider/src/theme/tema.dart';
import 'package:noticiaprovider/src/widgets/lista_noticas.dart';
import 'package:provider/provider.dart';

class Tab2Page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
     final newsService = Provider.of<NewService>(context);
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: <Widget>[
            _listaCategoria(),
            Expanded(child: ListaNoticia(newsService.getArticleByCategoryselece) ),
          ],
        ),
      ),
    );
  }
}

class _listaCategoria extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final categories = Provider.of<NewService>(context).categories;

    return Container(
      width: double.infinity,
      height: 80,
      child: ListView.builder(
          physics: BouncingScrollPhysics(),
          scrollDirection: Axis.horizontal,
          itemCount: categories.length,
          itemBuilder: (BuildContext context, int index) {
            final cName = categories[index].name;
            return Padding(
              padding: EdgeInsets.all(8),
              child: Column(
                children: <Widget>[
                  _CategoryBtn(categories[index]),
                  SizedBox(height: 5),
                  Text('${cName[0].toUpperCase()}${cName.substring(1)}')
                ],
              ),
            );
          }),
    );
  }
}

class _CategoryBtn extends StatelessWidget {
  final Category categorias;

  const _CategoryBtn(this.categorias);

  @override
  Widget build(BuildContext context) {
    final newService = Provider.of<NewService>(context);
    return GestureDetector(
      onTap: () {
        final newService = Provider.of<NewService>(context, listen: false);
        newService.selectCategroty =categorias.name;

      },
      child: Container(
        width: 40,
        height: 40,
        margin: EdgeInsets.symmetric(horizontal: 10),
        decoration: BoxDecoration(shape: BoxShape.circle, color: Colors.white),
        child: Icon(
          categorias.icon,
          color: (newService.selectCategroty == this.categorias.name)
          ? miTema.accentColor
          :Colors.black54,
        ),
      ),
    );
  }
}
