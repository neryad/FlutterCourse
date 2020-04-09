import 'dart:convert';
import 'dart:io';
import 'package:formvalidation/src/preferencias_usuarios/preferencias_usuario.dart';
import 'package:mime_type/mime_type.dart';
import 'package:http_parser/http_parser.dart';
import 'package:http/http.dart' as http;


import 'package:formvalidation/src/models/producto_model.dart';

class ProductoProvider {

  final String _url = 'https://flutter-varios-ece48.firebaseio.com';

  final _prefs = new PreferenciasUsuario();



 Future<bool>crearProducto(ProductoModel  producto ) async {
   final url = '$_url/producto.json?auth=${_prefs.token}';

   final res = await http.post(url, body: productoModelToJson(producto));

  //  final decodeData = json.decode(res.body);



   return true;
 }


  Future<bool>editarProducto(ProductoModel  producto ) async {

   final url = '$_url/producto/${producto.id}.json?auth=${_prefs.token}';

   final res = await http.put(url, body: productoModelToJson(producto));

   final decodeData = json.decode(res.body);

   print(decodeData);

   return true;
 }


  Future<List<ProductoModel>> cargarProductos() async {

    final url = '$_url/producto.json?auth=${_prefs.token}';
    final res =  await http.get(url);

    final Map<String,dynamic> decodeData = json.decode(res.body);
    final List<ProductoModel> productos = new List();


    if( decodeData == null) return [];

    if(decodeData[''] != null){
      return [];
    }

    decodeData.forEach((id, prod ){
      final prodTemp = ProductoModel.fromJson(prod);
      prodTemp.id = id;
      productos.add(prodTemp);
    });
  
    return productos;
  }


  Future<int>borrarProducto(String id) async {
     final url = '$_url/producto/$id.json?auth=${_prefs.token}';

     final res = await http.delete(url);

     print(json.decode(res.body));

     return 1;
  }

 Future<String> subirImage(File imagen) async{

   final url = Uri.parse('https://api.cloudinary.com/v1_1/dav4xetkl/image/upload?upload_preset=ar5ovmcc');

   final mimiTyep= mime(imagen.path).split('/');

   final imageUpReq = http.MultipartRequest(
     'POST',
     url
   );

   final file = await http.MultipartFile.fromPath(
     'file', 
     imagen.path,
     contentType: MediaType(mimiTyep[0],mimiTyep[1])
     );

     imageUpReq.files.add(file);

     final streamRes = await imageUpReq.send();

     final res = await http.Response.fromStream(streamRes);

        if(res.statusCode!= 200 && res.statusCode !=201 ) {
          print('Alago malo bebe');
          print(res.body);
          return null;
        }

        final resData = json.decode(res.body);
        print(resData);
        return resData['secure_url'];
 }

}