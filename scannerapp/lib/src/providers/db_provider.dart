import 'dart:io';
import 'package:path/path.dart';

import 'package:path_provider/path_provider.dart';
import 'package:scannerapp/src/models/scan_model.dart';
export 'package:scannerapp/src/models/scan_model.dart';
import 'package:sqflite/sqflite.dart';

class DBProvider {
  static Database _database;
  static final DBProvider db = DBProvider._();

  DBProvider._();

  Future<Database> get database async {
    if (_database != null) return _database;

    _database = await initDB();

    return _database;
  }

  initDB() async {
    Directory docDirectory = await getApplicationDocumentsDirectory();

    final path = join(docDirectory.path, 'ScansDB.db');

    return await openDatabase(path, version: 1, onOpen: (db) {},
        onCreate: (Database db, int version) async {
      await db.execute('CREATE TABLE Scans('
          'id INTEGER PRIMARY KEY,'
          'tipo TEXT,'
          'valor TEXT'
          ')');
    });
  }

  //Crear Registro
  // nuevoScanRaw( ScanModel nuevoScan ) async  {
  //   final db = await database;

  //   final res = await db.rawInsert(
  //     "INSERT INTO Scans (id,tipo,valor) "
  //     "VALUES (${nuevoScan.id},'${nuevoScan.tipo},''${nuevoScan.valor}')"
  //   );
  //   return res;
  // }

  nuevoScan(ScanModel nuevoScan) async {
    final db = await database;

    final res = await db.insert('Scans', nuevoScan.toJson());

    return res;
  }

  //Select - Obetner informacion

  Future<ScanModel> getScanId(int id) async {
    final db = await database;

    final res = await db.query('Scans', where: 'id = ?', whereArgs: [id]);

    return res.isNotEmpty ? ScanModel.fromJson(res.first) : null;
  }

  Future<List<ScanModel>> getAllSncas() async {
    final db = await database;

    final res = await db.query('Scans');

    List<ScanModel> list = res.isNotEmpty
        ? res.map((scan) => ScanModel.fromJson(scan)).toList()
        : [];

    return list;
  }

  Future<List<ScanModel>> getSncasTipo(String tipo) async {
    final db = await database;

    final res = await db.rawQuery("SELECT * FROM Scans WHERE tipo = '$tipo'");

    List<ScanModel> list = res.isNotEmpty
        ? res.map((scan) => ScanModel.fromJson(scan)).toList()
        : [];

    return list;
  }

  //Actilizar

  Future<int> updateScan(ScanModel nuevoScan) async {
    final db = await database;
    final res = await db.update('Scans', nuevoScan.toJson(),
        where: 'id=?', whereArgs: [nuevoScan.id]);

    return res;
  }

  //Elimianr por id

  Future<int> deleteScan(int id) async {
    final db = await database;
    final res = await db.delete('Scans', where: 'id=?', whereArgs: [id]);

    return res;
  }

  //Elimar todo

  Future<int> deleteAllScan() async {
    final db = await database;
    final res = await db.rawDelete('DELETE FROM Scans');

    return res;
  }
}
