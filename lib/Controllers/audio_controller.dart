import 'package:audioplayers/audioplayers.dart';
import 'package:reproductor_flutter/database/entities/cancion.dart';
import 'package:flutter/foundation.dart';

class AudioController {
  static final AudioController _singleton = AudioController._internal();

  factory AudioController() {
    return _singleton;
  }

  AudioController._internal() {
    reproductor.onDurationChanged.listen((Duration newDuration) {
      updateDuration(newDuration);
    });

    reproductor.onPlayerComplete.listen((_) {
      nextSong();
    });
  }

  final AudioPlayer reproductor = AudioPlayer();
  Duration duration = Duration.zero;
  Duration position = Duration.zero;
  bool isPlaying = false;
  late Cancion cancionActual;
  late List<Cancion> playlist;

  final ValueNotifier<bool> isPlayingNotifier = ValueNotifier(false);
  final ValueNotifier<Cancion> currentSongNotifier = ValueNotifier(Cancion(titulo: '', artista: '', filePath: ''));

  void updatePosition(Duration newPosition) {
    position = newPosition;
  }

  void updateDuration(Duration newDuration) {
    duration = newDuration;
  }

  void updatePlayingStatus(bool playing) {
    isPlaying = playing;
    isPlayingNotifier.value = playing;
  }

  void setPlaylist(List<Cancion> newPlaylist, int initialIndex) {
    playlist = newPlaylist;
    cancionActual = playlist[initialIndex];
    currentSongNotifier.value = cancionActual;
    playSong();
  }

  Future<void> playSong() async {
    await reproductor.setSource(DeviceFileSource(cancionActual.filePath));
    await reproductor.resume();
    updatePlayingStatus(true);
  }

  Future<void> playPause() async {
    if (isPlaying) {
      await reproductor.pause();
    } else {
      await reproductor.resume();
    }
    updatePlayingStatus(!isPlaying);
  }

  void nextSong() {
    int currentIndex = playlist.indexOf(cancionActual);
    cancionActual = playlist[(currentIndex + 1) % playlist.length];
    currentSongNotifier.value = cancionActual;
    playSong();
  }

  void previousSong() {
    int currentIndex = playlist.indexOf(cancionActual);
    cancionActual = playlist[(currentIndex - 1 + playlist.length) % playlist.length];
    currentSongNotifier.value = cancionActual;
    playSong();
  }

  Future<void> seek(Duration position) async {
    await reproductor.seek(position);
  }

  void dispose() {
    reproductor.dispose();
    isPlayingNotifier.dispose(); //cierra y libera recursos utilizado por AudioPlayer llamado reproductor
    currentSongNotifier.dispose(); //liberar recursos utilizados por el ValueNotifier<bool> llamado isPlayingNotifier. ValueNotifier
  }
}
