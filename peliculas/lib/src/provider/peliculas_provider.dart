import 'dart:convert';

import 'package:peliculas/src/models/pelicula_model.dart';
import 'package:http/http.dart' as http;
class PeliculasProvider{

  String _apekey = '262954bed4bbc548cd1ef39ba4b76107';
  String _url = 'api.themoviedb.org';
  String _language = 'es-ES';

Future <List<Pelicula>>getEnCines() async{

final url = Uri.https(_url, '3/movie/now_playing',{
  'api_key' : _apekey,
  'language' : _language
});

final resp = await http.get(url);

final descodeData = json.decode(resp.body);

final peliculas = new Peliculas.fromJsonList(descodeData['results']);
  print(peliculas.items[0]);
return [];

}


}