import 'package:flutter/material.dart';
import 'package:reproductor_flutter/screen/window_lista_horizontal.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, //quitar etiqueta 
      theme: ThemeData(
        brightness: Brightness.dark,
      ),
      home:  MusicListScreen(), //llama a la vista de lista
    );
  }
}