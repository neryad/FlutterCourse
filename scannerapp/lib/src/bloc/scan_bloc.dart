import 'dart:async';

import 'package:scannerapp/src/bloc/validators.dart';
import 'package:scannerapp/src/providers/db_provider.dart';

class ScansBloc with Validatos {
  static final ScansBloc _singleton = new ScansBloc._internal();

  factory ScansBloc() {
    return _singleton;
  }

  ScansBloc._internal() {
    //Obtener de la base de datos
    getScans();
  }

  final _scansController = StreamController<List<ScanModel>>.broadcast();

  Stream<List<ScanModel>> get scansStream => _scansController.stream.transform(validarGeo);
   Stream<List<ScanModel>> get scansStreamHttp => _scansController.stream.transform(validarHttp);

  dispose() {
    _scansController?.close();
  }

  getScans() async {
    _scansController.sink.add(await DBProvider.db.getAllSncas());
  }

  addScan(ScanModel scan) async {
   await DBProvider.db.nuevoScan(scan);
    getScans();
  }

  deleteScan(id) async {
    await DBProvider.db.deleteScan(id);
    getScans();
  }

  delAllScans() async {
    await DBProvider.db.deleteAllScan();
    getScans();
  }
}
