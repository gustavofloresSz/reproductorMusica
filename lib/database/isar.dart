import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';
import 'package:reproductor_flutter/database/entities/cancion.dart';

class IsarDatasource {
  late Future<Isar> db;
  IsarDatasource() {
    db = openDB();
  }

  Future<Isar> openDB() async {
    if (Isar.instanceNames.isEmpty) {
      final dir = await getApplicationDocumentsDirectory();
      return await Isar.open([CancionSchema], directory: dir.path);
    }
    return Future.value(Isar.getInstance());
  }

  Future<void> saveSong(Cancion cancion) async {
    final isar = await db;
    // insert
    isar.writeTxnSync(() => isar.cancions.putSync(cancion));
  }

  Future<List<Cancion>> loadsongs() async {
    final isar = await db;
    // load
    return isar.cancions.where().findAll();
  }
}