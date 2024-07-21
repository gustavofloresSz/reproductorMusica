import 'package:file_picker/file_picker.dart';
import 'package:reproductor_flutter/database/entities/cancion.dart';
import 'package:reproductor_flutter/database/isar.dart';
import 'package:flutter/material.dart';

class MusicListController {
  final isardb = IsarDatasource();

  Future<void> seleccionarCanciones(BuildContext context, Function onSongsAdded) async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.audio,
      allowMultiple: true,
    );

    if (result != null) {
      List<Cancion> nuevasCanciones = result.paths.map((path) {
        return Cancion(
          titulo: path?.split('/').last ?? 'Desconocido',
          artista: 'Desconocido',
          filePath: path ?? '',
        );
      }).toList();

      for (var elemento in nuevasCanciones) {
        if (!await esDuplicado(elemento)) {
          final cancion = Cancion(
            titulo: elemento.titulo,
            artista: elemento.artista,
            filePath: elemento.filePath,
          );
          await isardb.saveSong(cancion);
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Canción duplicada: ${elemento.titulo}'),
            ),
          );
        }
      }
      // Llama al callback para actualizar la lista
      onSongsAdded();
    }
  }

  Future<bool> esDuplicado(Cancion nuevaCancion) async {
    final canciones = await isardb.loadsongsBD();
    return canciones.any((cancion) => cancion.titulo == nuevaCancion.titulo);
  }

  Future<List<Cancion>> loadSongs() async {
    return await isardb.loadsongsBD();
  }
}
