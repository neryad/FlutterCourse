import 'dart:async';
import 'dart:convert';

import 'package:peliculas/src/models/actores_models.dart';
import 'package:peliculas/src/models/pelicula_model.dart';
import 'package:http/http.dart' as http;

class PeliculasProvider {
  String _apekey = '262954bed4bbc548cd1ef39ba4b76107';
  String _url = 'api.themoviedb.org';
  String _language = 'es-ES';

  int _popularesPAge = 0;

  bool _cargando = false;

  List<Pelicula> _populares = new List();

  final _popularesStream = StreamController<List<Pelicula>>.broadcast();

  Function(List<Pelicula>) get popularesSink => _popularesStream.sink.add;

  Stream<List<Pelicula>> get popularesStream => _popularesStream.stream;

  void disposeStreams() {
    _popularesStream?.close();
  }

  Future<List<Pelicula>> _procesarRepuesta(Uri url) async {
    final resp = await http.get(url);
    final descodeData = json.decode(resp.body);

    final peliculas = new Peliculas.fromJsonList(descodeData['results']);

    return peliculas.items;
  }

  Future<List<Pelicula>> getEnCines() async {
    final url = Uri.https(_url, '3/movie/now_playing',
        {'api_key': _apekey, 'language': _language});

    return await _procesarRepuesta(url);
  }

  Future<List<Pelicula>> getPopulares() async {
    if (_cargando) return [];
    _cargando = true;
    _popularesPAge++;

    final url = Uri.https(_url, '3/movie/popular', {
      'api_key': _apekey,
      'language': _language,
      'page': _popularesPAge.toString()
    });
    final resp = await _procesarRepuesta(url);
    _populares.addAll(resp);
    popularesSink(_populares);
    _cargando = false;
    return resp;
  }

  Future<List<Actor>> getCast(String peliId) async {

    final url = Uri.https(_url, '3/movie/$peliId/credits',
        {'api_key': _apekey, 'language': _language});
    final resp = await http.get(url);

    final decodeData = json.decode(resp.body);

    final cast = new Cast.fromJsonList(decodeData['cast']);

    return cast.actores;
  }


Future<List<Pelicula>> buscarPelicua(String query) async {
    final url = Uri.https(_url, '3/search/movie',
        {'api_key': _apekey, 'language': _language,'query' : query});

    return await _procesarRepuesta(url);
  }




}
