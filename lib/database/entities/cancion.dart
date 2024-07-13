import 'package:isar/isar.dart';

part 'cancion.g.dart';

@collection
class Cancion {
  Id id = Isar.autoIncrement;

  late String titulo;
  late String artista;
  late String filePath;
}
