import 'dart:io';

import 'package:flutter/material.dart';
import 'package:scannerapp/src/bloc/scan_bloc.dart';
import 'package:scannerapp/src/models/scan_model.dart';
import 'package:scannerapp/src/pages/direcciones_page.dart';
import 'package:scannerapp/src/pages/mapa_page.dart';
import 'package:barcode_scan/barcode_scan.dart';
import 'package:scannerapp/src/utils/utils.dart' as utils;
// import 'package:scannerapp/src/providers/db_provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final scansbloc = new ScansBloc();
  int currenIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('QR Scanner'), actions: <Widget>[
        IconButton(
          icon: Icon(Icons.delete_forever),
          onPressed: scansbloc.delAllScans,
        ),
      ]),
      body: _callPage(currenIndex),
      bottomNavigationBar: _bNavBar(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.filter_center_focus),
        onPressed: () =>_scanQR(context),
        backgroundColor: Theme.of(context).primaryColor,
      ),
    );
  }

  _scanQR(BuildContext context) async {
    // https://fernando-herrera.com
    //geo:40.71382463110316,-73.90843763789066
    //    String futureString = 'https://fernando-herrera.com';

    String futureString = '';

    try {
      futureString = await BarcodeScanner.scan();
    } catch (e) {
      futureString = e.toString();
    }

    if (futureString != null) {
      final scan = ScanModel(valor: futureString);
      scansbloc.addScan(scan);

      // final scan2 =
      //     ScanModel(valor: 'geo:40.71382463110316,-73.90843763789066');
      // scansbloc.addScan(scan2);
      // DBProvider.db.nuevoScan(scan);
      if (Platform.isIOS) {
        Future.delayed(Duration(milliseconds: 750), () {
          utils.openScan(context,scan);
        });
      } else {
        utils.openScan(context,scan);
      }
    }
  }

  Widget _callPage(int paginaActual) {
    switch (paginaActual) {
      case 0:
        return MapaPage();
      case 1:
        return DireccionesPage();

      default:
        return MapaPage();
    }
  }

  Widget _bNavBar() {
    return BottomNavigationBar(
      currentIndex: currenIndex,
      onTap: (index) {
        setState(() {
          currenIndex = index;
        });
      },
      items: [
        BottomNavigationBarItem(icon: Icon(Icons.map), title: Text('Mapa')),
        BottomNavigationBarItem(
            icon: Icon(Icons.brightness_5), title: Text('Direcciones')),
      ],
    );
  }
}
