import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:scannerapp/src/models/scan_model.dart';
import 'package:latlong/latlong.dart';

class MapasPage extends StatefulWidget {


  @override
  _MapasPageState createState() => _MapasPageState();
}

class _MapasPageState extends State<MapasPage> {
  final MapController mapCtrl = new MapController();

  String tipoMap = 'streets';

  @override
  Widget build(BuildContext context) {
    final ScanModel scan = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      appBar: AppBar(
        title: Text('Coordenadas QR'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.my_location),
            onPressed: () {
              mapCtrl.move(scan.getLatLng(), 15);
            },
          ),
        ],
      ),
      body: _crearMapa(scan),
      floatingActionButton: _crearBtn(context),
    );
  }

  Widget _crearMapa(ScanModel scan) {
    return FlutterMap(
      mapController: mapCtrl,
      options: MapOptions(center: scan.getLatLng(), zoom: 15),
      layers: [
        _crearM(),
        _crearMak(scan),
      ],
    );
  }

  _crearM() {
    return TileLayerOptions(
        urlTemplate: 'https://api.mapbox.com/v4/'
            '{id}/{z}/{x}/{y}@2x.png?access_token={accessToken}',
        additionalOptions: {
          'accessToken':
              'pk.eyJ1IjoiZWx3dWFzYSIsImEiOiJjazRuMmEwYXcyeTZ2M25vNnliaTMzYW1lIn0.E3Z6GDvKoM_NRsq3Sx0-pw',
          'id': 'mapbox.$tipoMap', //streets, dark, light, outdoors,satellite
        });
  }

  _crearMak(ScanModel scan) {
    return MarkerLayerOptions(markers: <Marker>[
      Marker(
          width: 100.0,
          height: 100.0,
          point: scan.getLatLng(),
          builder: (context) => Container(
              child: Icon(Icons.location_on,
                  size: 45.0, color: Theme.of(context).primaryColor)))
    ]);
  }

  Widget _crearBtn( BuildContext context) {
    return FloatingActionButton(
      onPressed: () {

        setState(() {
           //streets, dark, light, outdoors,satellite
        if (tipoMap == 'streets'){
          tipoMap = 'dark';
        } else if(tipoMap == 'dark'){
          tipoMap = 'light';
        }else if(tipoMap == 'light'){
          tipoMap = 'outdoors';
        }else if(tipoMap == 'outdoors'){
          tipoMap = 'satellite';
        } else {
           tipoMap = 'streets';
        }
        });
       
      },
      backgroundColor: Theme.of(context).primaryColor,
      child: Icon(Icons.repeat),
      );
  }
}
