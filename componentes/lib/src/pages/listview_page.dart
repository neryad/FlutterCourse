import 'dart:async';

import 'package:flutter/material.dart';

class ListaPAge extends StatefulWidget {
  @override
  _ListaPAgeState createState() => _ListaPAgeState();
}

class _ListaPAgeState extends State<ListaPAge> {
  ScrollController _scrollConteoller = new ScrollController();
  List<int> _listaNumeros = new List();
  int _ultimoItem = 0;

  bool _siloading = false;

  @override
  void initState() {
    super.initState();
    _agregar10();

    _scrollConteoller.addListener(() {
      if (_scrollConteoller.position.pixels ==
          _scrollConteoller.position.maxScrollExtent) {
        //_agregar10();
        fecthData();
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    _scrollConteoller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Listas'),
      ),
      body: Stack(
        children: <Widget>[_crearLista(), _crearLoading()],
      ),
    );
  }

  Widget _crearLista() {
    return RefreshIndicator(
        onRefresh: obtenerPAgina1,
        child: ListView.builder(
        controller: _scrollConteoller,
        itemCount: _listaNumeros.length,
        itemBuilder: (BuildContext context, int index) {
          final imagen = _listaNumeros[index];
          return FadeInImage(
            image: NetworkImage('https://picsum.photos//500/300?image=$imagen'),
            placeholder: AssetImage('assets/jar-loading.gif'),
          );
        },
      ),
    );
  }
  Future<Null> obtenerPAgina1() async{
    final duration = new Duration(seconds: 2);
    new Timer( duration, (){
      _listaNumeros.clear();
      _ultimoItem++;
      _agregar10();
    });
    return Future.delayed(duration);
  }
  void _agregar10() {
    for (var i = 1; i < 10; i++) {
      _ultimoItem++;
      _listaNumeros.add(_ultimoItem);
      setState(() {});
    }
  }

  Future<Null> fecthData() async {
    _siloading = true;
    setState(() {});
    final duration = new Duration(seconds: 2);
    return new Timer(duration, repuestaHTTP);
  }

  void repuestaHTTP() {
    _siloading = false;
    _scrollConteoller.animateTo(_scrollConteoller.position.pixels + 100,
        curve: Curves.fastOutSlowIn, duration: Duration(milliseconds: 250));
    _agregar10();
  }

  Widget _crearLoading() {
    if (_siloading) {
      return Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[CircularProgressIndicator()],
          ),
          SizedBox(height: 15.0),
        ],
      );
    } else {
      return Container();
    }
  }
}