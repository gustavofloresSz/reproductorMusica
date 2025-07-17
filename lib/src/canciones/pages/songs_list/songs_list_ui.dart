import 'package:flutter/material.dart';
import 'package:flutter_testr/src/canciones/pages/song_detail/song_detail_component.dart';
import 'package:flutter_testr/src/canciones/pages/song_detail/song_detail_ui.dart';
import 'package:flutter_testr/src/canciones/pages/songs_list/songs_list_component.dart';
import 'package:flutter_testr/src/database/models/entities/cancion.dart';

class SongsListUi extends StatefulWidget {
  @override
  _SongsListUiState createState() => _SongsListUiState();
}

class _SongsListUiState extends State<SongsListUi> {
  late SongsListComponent component;

  @override
  void initState() {
    super.initState();
    component = SongsListComponent();
    component.addListener(() {
      if (mounted) {
        setState(() {});
      }
    });
  }

  @override
  void dispose() {
    component.removeListener(() {});
    component.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lista de Canciones'),
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () => component.onAddSongsPressed(context),
          ),
        ],
      ),
      body: IndexedStack(
        index: component.indiceSelecionado,
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
        currentIndex: component.indiceSelecionado,
        selectedItemColor: Colors.yellow,
        onTap: component.onItemTapped,
      ),
    );
  }

  Widget _buildMusicList() {
    return Column(
      children: [
        Expanded(
          child: ListView.builder(
            itemCount: component.playlist.length,
            itemBuilder: (context, index) {
              final cancion = component.playlist[index];
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 4.0),
                child: Container(
                  decoration: BoxDecoration(
                    border: component.indiceReproduccionActual == index
                        ? Border.all(color: Colors.blue, width: 2)
                        : null,
                  ),
                  child: ListTile(
                    // leading: Image.asset(
                    //   'assets/img/logoSong2.png',
                    //   width: 45,
                    //   height: 45,
                    //   fit: BoxFit.cover,
                    // ),
                    title: Text(cancion.titulo),
                    onTap: () {
                      component.onSongTapped(index);
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => SongDetailUi(
                            component: SongDetailComponent(),
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
        _buildMiniPlayer(),
      ],
    );
  }

  Widget _buildMiniPlayer() {
    return ValueListenableBuilder<Cancion>(
      valueListenable: component.audioController.currentSongNotifier,
      builder: (context, cancion, _) {
        return cancion.filePath.isNotEmpty
            ? GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => SongDetailUi(
                        component: SongDetailComponent(),
                      ),
                    ),
                  );
                },
                child: Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: Text(
                          cancion.titulo,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(color: Colors.yellow),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          IconButton(
                            color: Colors.yellow,
                            icon: const Icon(Icons.skip_previous),
                            onPressed: component.onPreviousSong,
                          ),
                          ValueListenableBuilder<bool>(
                            valueListenable: component.audioController.isPlayingNotifier,
                            builder: (context, isPlaying, _) {
                              return IconButton(
                                color: Colors.yellow,
                                icon: Icon(isPlaying ? Icons.pause : Icons.play_arrow),
                                onPressed: component.onPlayPause,
                              );
                            },
                          ),
                          IconButton(
                            color: Colors.yellow,
                            icon: Icon(Icons.skip_next),
                            onPressed: component.onNextSong,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              )
            : Container();
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