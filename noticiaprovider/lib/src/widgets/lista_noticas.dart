import 'package:flutter/material.dart';
import 'package:noticiaprovider/src/models/news_models.dart';
import 'package:noticiaprovider/src/theme/tema.dart';

class ListaNoticia extends StatelessWidget {
  final List<Article> noticias;

  const ListaNoticia(this.noticias);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: this.noticias.length,
      itemBuilder: (BuildContext context, int index) {
        return _Noticia(noticia: this.noticias[index], index: index);
      },
    );
  }
}

class _Noticia extends StatelessWidget {
  @required
  final Article noticia;
  @required
  final int index;

  const _Noticia({this.noticia, this.index});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        _TarjetaTopBar(noticia, index),
        _TrajetaTitulo(noticia),
        _TarjetaImg(noticia),
        _TarjetaBody(noticia),
        SizedBox(height: 10),
        _Tarjetafooter(),
        Divider(),
      ],
    );
  }
}

class _Tarjetafooter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[Container()],
        // children: <Widget>[

        //   RawMaterialButton(
        //     onPressed: () {},
        //     shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        //     child: Icon(Icons.star_border),
        //     fillColor: miTema.accentColor,

        //   ),

        //   SizedBox(width:10),

        //    RawMaterialButton(
        //     onPressed: () {},
        //     shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        //     child: Icon(Icons.more),
        //     fillColor: Colors.blue,

        //   ),
        // ],
      ),
    );
  }
}

class _TarjetaBody extends StatelessWidget {
  final Article noticia;

  const _TarjetaBody(this.noticia);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Text((noticia.description != null) ? noticia.description : ''),
    );
  }
}

class _TarjetaImg extends StatelessWidget {
  final Article noticia;

  const _TarjetaImg(this.noticia);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: ClipRRect(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(50), bottomRight: Radius.circular(50)),
        child: Container(
            child: (noticia.urlToImage != null)
                ? FadeInImage(
                    placeholder: AssetImage('assets/img/giphy.gif'),
                    image: NetworkImage(noticia.urlToImage))
                : Image(
                    image: AssetImage('assets/img/no-image.png'),
                  )),
      ),
    );
  }
}

class _TrajetaTitulo extends StatelessWidget {
  final Article noticia;
  const _TrajetaTitulo(this.noticia);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 15),
        child: Text(
          noticia.title,
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
        ));
  }
}

class _TarjetaTopBar extends StatelessWidget {
  final Article noticia;
  final int index;

  const _TarjetaTopBar(this.noticia, this.index);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10),
      margin: EdgeInsets.only(bottom: 10),
      child: Row(
        children: <Widget>[
          Text(
            '${index + 1}',
            style: TextStyle(color: miTema.accentColor),
          ),
          Text(
            '${noticia.source.name}',
          ),
        ],
      ),
    );
  }
}
