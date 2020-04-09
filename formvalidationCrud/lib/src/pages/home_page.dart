import 'package:flutter/material.dart';
import 'package:formvalidation/src/blocs/provider.dart';
import 'package:formvalidation/src/models/producto_model.dart';
import 'package:formvalidation/src/provider/productos_providers.dart';

class HomePage extends StatelessWidget {
  final productosProvider = new ProductoProvider();

  @override
  Widget build(BuildContext context) {
    final bloc = Provider.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Welcome to home page'),
      ),
      body: _crearListado(),
      floatingActionButton: _crearBtn(context),
    );
  }

  Widget _crearListado() {
    return FutureBuilder(
      future: productosProvider.cargarProductos(),
      builder:
          (BuildContext context, AsyncSnapshot<List<ProductoModel>> snashot) {
        if (snashot.hasData) {
          final produtos = snashot.data;
          return ListView.builder(
            itemCount: produtos.length,
            itemBuilder: (context, i) => _crearItem(context, produtos[i]),
          );
        } else {
          return Center(child: CircularProgressIndicator());
        }
      },
    );
  }

  Widget _crearItem(BuildContext context, ProductoModel producto) {
    return Dismissible(
      key: UniqueKey(),
      background: Container(color: Colors.red),
      onDismissed: (direccion) {
        productosProvider.borrarProducto(producto.id);
      },
      child: Card(
        child: Column(
          children: <Widget>[
            (producto.fotoUrl == null)
                ? Image(image: AssetImage('assets/no-image.png'))
                : FadeInImage(
                    placeholder: AssetImage('assets/loading.gif'),
                    image: NetworkImage(producto.fotoUrl),
                    height: 300.0,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
            ListTile(
              title: Text('${producto.titulo} - ${producto.valor}'),
              subtitle: Text('${producto.id}'),
              onTap: () =>
                  Navigator.pushNamed(context, 'producto', arguments: producto),
            )
          ],
        ),
      ),
    );
  }

  _crearBtn(BuildContext context) {
    return FloatingActionButton(
      child: Icon(Icons.add),
      backgroundColor: Colors.deepPurple,
      onPressed: () => Navigator.pushNamed(context, 'producto'),
    );
  }
}
