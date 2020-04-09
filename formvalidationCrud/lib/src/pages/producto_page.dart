import 'dart:io';

import 'package:flutter/material.dart';
import 'package:formvalidation/src/models/producto_model.dart';
import 'package:formvalidation/src/provider/productos_providers.dart';
import 'package:formvalidation/src/utils/utils.dart' as utils;
import 'package:image_picker/image_picker.dart';

class ProductoPage extends StatefulWidget {

  @override
  _ProductoPageState createState() => _ProductoPageState();
}

class _ProductoPageState extends State<ProductoPage> {
  final formKey = GlobalKey<FormState>();
  final scaffoldKey = GlobalKey<ScaffoldState>();
   
  final productoProvider = new ProductoProvider();
  ProductoModel producto = new ProductoModel();

  bool _guardando = false;

  File photo;


  @override
  Widget build(BuildContext context) {
    final ProductoModel prodData = ModalRoute.of(context).settings.arguments;

    if (prodData != null) {
      producto = prodData;
    }
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        title: Text('Producto'),
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.photo_size_select_actual), 
              onPressed: _seleccionarFoto,
              ),
          IconButton(icon: Icon(Icons.camera_alt), onPressed:_tomarFoto),
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(15.0),
          child: Form(
            key: formKey,
            child: Column(
              children: <Widget>[
                _mostrarFoto(),
                _crearNombre(),
                _crearPrecio(),
                _crarDisponible(),
                _crearBtn(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _crearNombre() {
    return TextFormField(
      initialValue: producto.titulo,
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(
        labelText: 'Producto',
      ),
      onSaved: (vale) => producto.titulo = vale,
      validator: (value){
        if (value.length < 3) { 
          return 'Ingrese el nombre del producto';
        } else {
          return null;
        }
      },
    );
  }

  Widget _crearPrecio() {
    return TextFormField(
      initialValue: producto.valor.toString(),
      keyboardType: TextInputType.numberWithOptions(decimal: true),
      decoration: InputDecoration(
        labelText: 'Precio',
      ),
      onSaved: (value) => producto.valor = double.parse(value),
      validator: (value){
        
        if(utils.isNum(value)){
          return null;
        } else {
          return 'Solo numeros';
        }
      },
    );
  }

  Widget _crarDisponible(){
    return SwitchListTile(
      value: producto.disponible, 
      title: Text('Disponible'),
      activeColor: Colors.deepPurple,
      onChanged: (value) => setState((){
        producto.disponible = value;
      }),
    );
  }

  Widget _crearBtn() {
    return RaisedButton.icon(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
      color: Colors.deepPurple,
      textColor: Colors.white,
      onPressed: (_guardando) ? null : _submit,
      icon: Icon(Icons.save),
      label: Text('Save'),
    );
  }

  void _submit() async {

    if(!formKey.currentState.validate() ) return;

    formKey.currentState.save();

 
    setState(() {
         _guardando = true;
    });


    if(photo != null){
      producto.fotoUrl = await productoProvider.subirImage(photo);
    }
    // print(producto.titulo);
    // print(producto.valor);
    // print(producto.disponible);
 
    if ( producto.id == null){
       productoProvider.crearProducto(producto);
    } else {
      productoProvider.editarProducto(producto);
    }
   
    mostrarSnackBar('Registro guardado');

    Navigator.pop(context);

      setState(() {
         _guardando = false;
    });

  }

   void mostrarSnackBar( String msg) {
    final snackBar = SnackBar(
      content: Text(msg),
      duration: Duration(milliseconds:1500),
    );
    scaffoldKey.currentState.showSnackBar(snackBar);
  }

  // _mostrarFoto() {
  //   if (producto.fotoUrl != null ){
  //     return Container();
  //   } else { 
  //     return Image(
  //       image: AssetImage( photo?.path??'assets/no-image.png'),
  //       height: 300.0,
  //       fit: BoxFit.cover,
  //     );
  //   }
  // }

  _mostrarFoto() {
 
    if (producto.fotoUrl != null) {
 
      return FadeInImage(
        placeholder: AssetImage('assets/loading.gif'),
        image: NetworkImage(producto.fotoUrl),
        height: 300.0,
        fit: BoxFit.contain,
      );
 
    } else {
 
      if( photo != null ){
        return Image.file(
          photo,
          fit: BoxFit.cover,
          height: 300.0,
        );
      }
      return Image.asset('assets/no-image.png');
    }
  }

  _seleccionarFoto() async  {

    _procesarImage(ImageSource.gallery);


  }

  _tomarFoto() async{

    _procesarImage(ImageSource.camera);

  }

  _procesarImage( ImageSource origen) async  {

    photo = await ImagePicker.pickImage(
      source: origen
    );

    if(photo != null) {
      producto.fotoUrl = null;
    }

    setState(() {
      
    });
  }


}
