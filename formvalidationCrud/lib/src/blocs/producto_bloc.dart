import 'dart:io';

import 'package:formvalidation/src/models/producto_model.dart';
import 'package:formvalidation/src/provider/productos_providers.dart';
import 'package:rxdart/rxdart.dart';

class ProductoBloc {
  final _productosCtrl = new BehaviorSubject<List<ProductoModel>>();
  final _cargandoCtrl = new BehaviorSubject<bool>();

  final _productoProvider = new ProductoProvider();

  Stream<List<ProductoModel>> get productoStream => _productosCtrl.stream;
  Stream<bool> get cargadnoStrema => _cargandoCtrl.stream;

  void cargarProductos() async {
    final productos = await _productoProvider.cargarProductos();
    _productosCtrl.sink.add(productos);
  }

  void agregarProductos(ProductoModel producto) async {
    _cargandoCtrl.sink.add(true);
    await _productoProvider.crearProducto(producto);
    _cargandoCtrl.sink.add(false);
  }

  Future<String> subirFoto(File foto) async {
    _cargandoCtrl.sink.add(true);
    final fotoUrl = await _productoProvider.subirImage(foto);
    _cargandoCtrl.sink.add(false);

    return fotoUrl;
  }

  void editarProductos(ProductoModel producto) async {
    _cargandoCtrl.sink.add(true);
    await _productoProvider.editarProducto(producto);
    _cargandoCtrl.sink.add(false);
  }

   void borrarProductos(String id) async {

    await _productoProvider.borrarProducto(id);

  }

  dispose() {
    _productosCtrl?.close();
    _cargandoCtrl?.close();
  }
}
