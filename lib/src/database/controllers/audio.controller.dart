import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

import 'package:flutter_testr/src/database/models/entities/cancion.dart';

class AudioController {
  static final AudioController _singleton = AudioController._internal();

  factory AudioController() {
    return _singleton;
  }

  AudioController._internal() {
    reproductor.onDurationChanged.listen((Duration newDuration) {
      updateDuration(newDuration);
    });
    reproductor.onPositionChanged.listen((Duration newPosition) {
      updatePosition(newPosition);
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
  final ValueNotifier<Duration> positionNotifier = ValueNotifier(Duration.zero);
  final ValueNotifier<Duration> durationNotifier = ValueNotifier(Duration.zero);

  final ValueNotifier<bool> isPlayingNotifier = ValueNotifier(false);
  final ValueNotifier<Cancion> currentSongNotifier = ValueNotifier(Cancion(titulo: '', artista: '', filePath: ''));

  void updatePosition(Duration newPosition) {
    position = newPosition;
    positionNotifier.value = newPosition;
  }

  void updateDuration(Duration newDuration) {
    duration = newDuration;
    durationNotifier.value = newDuration;
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
    positionNotifier.dispose();
    durationNotifier.dispose();
    isPlayingNotifier.dispose(); //cierra y libera recursos utilizado por AudioPlayer llamado reproductor
    currentSongNotifier.dispose(); //liberar recursos utilizados por el ValueNotifier<bool> llamado isPlayingNotifier. ValueNotifier
  }
}
