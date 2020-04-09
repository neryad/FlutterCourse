import 'package:flutter/material.dart';

class HomePageTemp extends StatelessWidget {
  final opciones = ['Uno', 'Dos', 'Tres', 'Cuatro', 'Cinco'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Componentes Temp')),
      body: ListView(children: _crearItemCorto()),
    );
  }

  // List<Widget> _crearItem() {
  //   List<Widget> lista = new List<Widget>();

  //   for (String opt in opciones) {
  //     final tempWinde = ListTile(
  //       title: Text(opt),
  //     );

  //     lista..add(tempWinde)..add(Divider());
  //   }
  //   return lista;
  // }

  List<Widget> _crearItemCorto() {
    return opciones.map((item) {
      return Column(
        children: <Widget>[
          ListTile(
            title: Text(item + '!'),
            subtitle: Text('data'),
            leading: Icon(Icons.account_balance_wallet),
            trailing: Icon(Icons.keyboard_arrow_right),
            onTap: (){},
          ),
          Divider(),
        ],
      );
    }).toList();

    // var widgets = opciones.map((item) {
    //   return ListTile(
    //     title: Text(item + '!'),
    //   );
    // }).toList();

    // return widgets;
  }
}
