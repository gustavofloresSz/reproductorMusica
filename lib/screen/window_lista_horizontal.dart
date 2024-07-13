import 'package:flutter/material.dart';
import 'package:reproductor_flutter/music.dart';
import 'package:file_picker/file_picker.dart';
import 'package:reproductor_flutter/screen/window_reproducir.dart';

class MusicListScreen extends StatefulWidget {
  @override
  _MusicListScreenState createState() => _MusicListScreenState();
}

class _MusicListScreenState extends State<MusicListScreen> {
  List<Music> _playlist = [];
  int _selectedIndex = 0;

  Future<void> _seleccionarCanciones() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.audio,
      allowMultiple: true,
    );

    if (result != null) {
      setState(() {
        List<Music> nuevasCanciones = result.paths.map((path) {
          return Music(
            titulo: path?.split('/').last ?? 'Desconocido',
            artista: 'Desconocido',
            filePath: path ?? '',
            duracion: Duration.zero,
          );
        }).toList();

        _playlist.addAll(nuevasCanciones);
      });
    }
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
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
            onPressed: _seleccionarCanciones,
          ),
        ],
      ),
      body: IndexedStack(
        index: _selectedIndex,
        children: <Widget>[
          _buildMusicList(),
          _buildFavorites(),
          _buildPlaylists(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.music_note, color: Colors.blue,),
            label: 'Canciones',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite, color: Colors.red,),
            label: 'Favoritos',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.playlist_play, color: Colors.green,),
            label: 'Playlists',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.black,
  
        onTap: _onItemTapped,
      ),
    );
  }

  Widget _buildMusicList() {
    return ListView.builder(
      itemCount: _playlist.length,
      itemBuilder: (context, index) {
        final cancion = _playlist[index];
        return ListTile(
          title: Text(cancion.titulo),
          subtitle: Text(cancion.artista),
          onTap: () {
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
        );
      },
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