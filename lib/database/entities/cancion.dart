import 'package:isar/isar.dart';

part 'cancion.g.dart';

@collection
class Cancion {
  Id id = Isar.autoIncrement;

  final String titulo;
  final String artista;
  final String filePath;

  Cancion({required this.titulo, required this.artista, required this.filePath});
}

