import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:formvalidation/src/preferencias_usuarios/preferencias_usuario.dart';

class UsuarioProvider {

  final String _firebaseToekn = 'AIzaSyBX3k5zCvcWuBsyBlvbXzTRP6D263q_di0';
  final _prefs = new PreferenciasUsuario();

   Future <Map<String, dynamic>> login(String email, String password) async {

       final autData = {
      'email': email,
      'password': password,
      'returnSecureToken' : true
    };


    final res = await http.post(
      'https://identitytoolkit.googleapis.com/v1/accounts:signInWithPassword?key=$_firebaseToekn',

      body: json.encode(autData)
    );

    Map<String, dynamic> decoRes = json.decode(res.body);

    print(decoRes);

    if(decoRes.containsKey('idToken')){
      _prefs.token = decoRes['idToken'];
      return {'ok': true,'token':decoRes['idToken']};
    } else {
      return {'ok': false,'message':decoRes['error']['message']};
    }

  }

  Future <Map<String, dynamic>> nuevoUsuario(String email, String password) async  { 

    final autData = {
      'email': email,
      'password': password,
      'returnSecureToken' : true
    };


    final res = await http.post(
      'https://identitytoolkit.googleapis.com/v1/accounts:signUp?key=$_firebaseToekn',

      body: json.encode(autData)
    );

    Map<String, dynamic> decoRes = json.decode(res.body);

    print(decoRes);

    if(decoRes.containsKey('idToken')){
      //salcat oke
      return {'ok': true,'token':decoRes['idToken']};
    } else {
      return {'ok': false,'message':decoRes['error']['message']};
    }
  }



}