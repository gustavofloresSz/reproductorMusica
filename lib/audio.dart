import 'package:audioplayers/audioplayers.dart';

class AudioManager {
  static final AudioManager _singleton = AudioManager._internal();

  factory AudioManager() {
    return _singleton;
  }

  AudioManager._internal();

  final AudioPlayer reproductor = AudioPlayer();

  Duration duration = Duration.zero;
  Duration position = Duration.zero;
  bool isPlaying = false;

  void updatePosition(Duration newPosition) {
    position = newPosition;
  }

  void updateDuration(Duration newDuration) {
    duration = newDuration;
  }

  void updatePlayingStatus(bool playing) {
    isPlaying = playing;
  }
}
