import 'package:flutter/material.dart';
import 'package:flutter_testr/src/database/controllers/audio.controller.dart';

class SongDetailComponent extends ChangeNotifier {
  final AudioController audioController = AudioController();

  Duration get duration => audioController.duration;
  Duration get position => audioController.position;
  ValueNotifier<Duration> get positionNotifier => audioController.positionNotifier;
  ValueNotifier<Duration> get durationNotifier => audioController.durationNotifier;

  void playPause() {
    audioController.playPause();
  }

  void nextSong() {
    audioController.nextSong();
  }

  void previousSong() {
    audioController.previousSong();
  }

  void seek(Duration nuevaPosicion) {
    audioController.seek(nuevaPosicion);
  }
  
}