import 'package:flutter/material.dart';
import 'package:reproductor_flutter/database/entities/cancion.dart';
import 'package:reproductor_flutter/screen/window_reproducir.dart';
import 'package:reproductor_flutter/Controllers/w_lista_horizontal_controller.dart';
import 'package:reproductor_flutter/Controllers/audio_controller.dart';

class MusicListScreen extends StatefulWidget {
  @override
  _MusicListScreenState createState() => _MusicListScreenState();
}

class _MusicListScreenState extends State<MusicListScreen> {
  final MusicListController musicController = MusicListController();
  final AudioController audioController = AudioController();
  List<Cancion> _playlist = [];
  int indiceSelecionado = 0;
  int? indiceReproduccionActual;

  void _onItemTapped(int index) {
    setState(() {
      indiceSelecionado = index;
    });
  }

  @override
  void initState() {
    super.initState();
    _loadSongs();

    audioController.currentSongNotifier.addListener(() {
      setState(() {
        indiceReproduccionActual = _playlist.indexWhere((cancion) => cancion.filePath == audioController.currentSongNotifier.value.filePath);
      });
    });
  }

  void _loadSongs() async {
    List<Cancion> songs = await musicController.loadSongs();
    setState(() {
      _playlist = songs;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lista de Canciones'),
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () => musicController.seleccionarCanciones(context, _loadSongs),
          ),
        ],
      ),
      body: IndexedStack(
        index: indiceSelecionado,
        children: <Widget>[
          _buildMusicList(),
          _buildFavorites(),
          _buildPlaylists(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(
              Icons.music_note,
              color: Colors.blue,
            ),
            label: 'Canciones',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.favorite,
              color: Colors.red,
            ),
            label: 'Favoritos',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.playlist_play,
              color: Colors.green,
            ),
            label: 'Playlists',
          ),
        ],
        currentIndex: indiceSelecionado,
        selectedItemColor: Colors.yellow,
        onTap: _onItemTapped,
      ),
    );
  }

  Widget _buildMusicList() {
  return Column(
    children: [
      Expanded(
        child: ListView.builder(
          itemCount: _playlist.length,
          itemBuilder: (context, index) {
            final cancion = _playlist[index];
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 4.0), // Espacio vertical entre canciones
              child: Container(
                decoration: BoxDecoration(
                  border: indiceReproduccionActual == index
                      ? Border.all(color: Colors.blue, width: 2)
                      : null,
                ),
                child: ListTile(
                  leading: Image.asset(
                    'assets/img/logoSong2.png', // Ruta de la imagen
                    width: 45, // Ancho de la imagen
                    height: 45, // Altura de la imagen
                    fit: BoxFit.cover, // Ajusta la imagen
                  ),
                  title: Text(cancion.titulo),
                  //subtitle: Text(cancion.artista),
                  onTap: () {
                    audioController.setPlaylist(_playlist, index);
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => MusicPlayerScreen(
                          playlist: _playlist,
                          indiceInicial: index,
                        ),
                      ),
                    );
                  },
                ),
              ),
            );
          },
        ),
      ),
      ValueListenableBuilder<Cancion>(
        valueListenable: audioController.currentSongNotifier,
        builder: (context, cancion, _) {
          return cancion.filePath.isNotEmpty
              ? GestureDetector(
                  onTap: () {
                    int currentIndex = _playlist.indexWhere((element) => element.filePath == cancion.filePath);
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => MusicPlayerScreen(
                          playlist: _playlist,
                          indiceInicial: currentIndex,
                        ),
                      ),
                    );
                  },
                  child: Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Row(
                      children: [
                        Expanded(
                          child: Text(cancion.titulo, maxLines: 2, overflow: TextOverflow.ellipsis, style: const TextStyle(color: Colors.yellow)),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            IconButton(
                              color: Colors.yellow,
                              icon: const Icon(Icons.skip_previous),
                              onPressed: () {
                                audioController.previousSong();
                              },
                            ),
                            ValueListenableBuilder<bool>(
                              valueListenable: audioController.isPlayingNotifier,
                              builder: (context, isPlaying, _) {
                                return IconButton(
                                  color: Colors.yellow,
                                  icon: Icon(isPlaying ? Icons.pause : Icons.play_arrow),
                                  onPressed: () {
                                    audioController.playPause();
                                  },
                                );
                              },
                            ),
                            IconButton(
                              color: Colors.yellow,
                              icon: Icon(Icons.skip_next),
                              onPressed: () {
                                audioController.nextSong();
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                )
              : Container();
        },
      ),
    ],
  );
}


  Widget _buildFavorites() {
    return Center(
      child: Text('Favoritos FALTA AGREGAR'),
    );
  }
  Widget _buildPlaylists() {
    return Center(
      child: Text('Playlists FALTA AGREGAR'),
    );
  }
}
