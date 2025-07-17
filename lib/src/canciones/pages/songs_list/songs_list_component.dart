import 'package:flutter/material.dart';
import 'package:flutter_testr/src/canciones/services/songs_list_service.dart';
import 'package:flutter_testr/src/database/controllers/audio.controller.dart';
import 'package:flutter_testr/src/database/models/entities/cancion.dart';


class SongsListComponent extends ChangeNotifier {
  final SongsListService musicController = SongsListService();
  final AudioController audioController = AudioController();
  
  List<Cancion> _playlist = [];
  int _indiceSelecionado = 0;
  int? _indiceReproduccionActual;

  // Getters
  List<Cancion> get playlist => _playlist;
  int get indiceSelecionado => _indiceSelecionado;
  int? get indiceReproduccionActual => _indiceReproduccionActual;

  SongsListComponent() {
    _initializeComponent();
  }

  void _initializeComponent() {
    loadSongs();
    
    audioController.currentSongNotifier.addListener(() {
      _updateCurrentPlayingIndex();
    });
  }

  void _updateCurrentPlayingIndex() {
    final index = _playlist.indexWhere(
      (cancion) => cancion.filePath == audioController.currentSongNotifier.value.filePath,
    );
    if (_indiceReproduccionActual != index) {
      _indiceReproduccionActual = index;
      notifyListeners(); // solo si cambió realmente
    }
  }

  void onItemTapped(int index) {
    _indiceSelecionado = index;
    notifyListeners();
  }

  Future<void> loadSongs() async {
    List<Cancion> songs = await musicController.loadSongs();
    _playlist = songs;
    notifyListeners();
  }

  void onAddSongsPressed(BuildContext context) {
    musicController.seleccionarCanciones(context, loadSongs);
  }

  void onSongTapped(int index) {
    audioController.setPlaylist(_playlist, index);
  }

  void onMiniPlayerTapped() {
    // Lógica para cuando se toca el mini reproductor
  }

  void onPreviousSong() {
    audioController.previousSong();
  }

  void onPlayPause() {
    audioController.playPause();
  }

  void onNextSong() {
    audioController.nextSong();
  }

  int getCurrentSongIndex() {
    return _playlist.indexWhere(
      (element) => element.filePath == audioController.currentSongNotifier.value.filePath
    );
  }

  @override
  void dispose() {
    audioController.currentSongNotifier.removeListener(_updateCurrentPlayingIndex);
    super.dispose();
  }
}