import 'package:flutter/material.dart';
import 'package:flutter_testr/src/canciones/pages/songs_list/songs_list_ui.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, // Quita la etiqueta de debug
      theme: ThemeData(
        brightness: Brightness.dark, // Tema oscuro
        useMaterial3: true, // Si usás Material 3
      ),
      home: SongsListUi(), // Tu vista inicial
    );
  }
}


/* Se agrego esto en el archivo de android/buil.gradle para que isar funcione
android {
  namespace 'dev.isar.isar_flutter_libs'
  ...
}
*/