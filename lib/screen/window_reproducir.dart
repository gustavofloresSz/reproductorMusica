import 'package:flutter/material.dart';
import 'package:reproductor_flutter/Controllers/audio_controller.dart';
import 'package:reproductor_flutter/database/entities/cancion.dart';

class MusicPlayerScreen extends StatefulWidget {
  final List<Cancion> playlist;
  final int indiceInicial;

  const MusicPlayerScreen({
    required this.playlist,
    required this.indiceInicial,
    Key? key}) : super(key: key);

  @override
  _MusicPlayerScreenState createState() => _MusicPlayerScreenState();
}

class _MusicPlayerScreenState extends State<MusicPlayerScreen> {
  late AudioController adminAudio;

  @override
  void initState() {
    super.initState();
    adminAudio = AudioController();
    adminAudio.setPlaylist(widget.playlist, widget.indiceInicial);

    adminAudio.reproductor.onDurationChanged.listen((d) {
      if (mounted) {
        setState(() {
          adminAudio.updateDuration(d);
        });
      }
    });

    adminAudio.reproductor.onPositionChanged.listen((p) {
      if (mounted) {
        setState(() {
          adminAudio.updatePosition(p);
        });
      }
    });

    adminAudio.reproductor.onPlayerComplete.listen((event) {
    });
    adminAudio.playSong();
  }

  @override
  void dispose() {
    super.dispose();
    //adminAudio.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Reproductor de Musica GFS'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ValueListenableBuilder<Cancion>(
              valueListenable: adminAudio.currentSongNotifier,
              builder: (context, cancion, _) {
                return Column(
                  children: [
                    Text(
                      cancion.titulo,
                      style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      cancion.artista,
                      style: const TextStyle(fontSize: 18, color: Colors.grey),
                    ),
                    const SizedBox(height: 32),
                    CircleAvatar(
                      radius: 80,
                      child: Icon(Icons.music_note, size: 80),
                    ),
                  ],
                );
              },
            ),
            const SizedBox(height: 32),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  icon: const Icon(Icons.skip_previous),
                  iconSize: 48,
                  onPressed: () {
                    setState(() {
                      adminAudio.previousSong();
                    });
                  },
                ),
                ValueListenableBuilder<bool>(
                  valueListenable: adminAudio.isPlayingNotifier,
                  builder: (context, isPlaying, _) {
                    return IconButton(
                      icon: Icon(isPlaying ? Icons.pause : Icons.play_arrow),
                      iconSize: 64,
                      onPressed: () {
                        setState(() {
                          adminAudio.playPause();
                        });
                      },
                    );
                  },
                ),
                IconButton(
                  icon: const Icon(Icons.skip_next),
                  iconSize: 48,
                  onPressed: () {
                    setState(() {
                      adminAudio.nextSong();
                    });
                  },
                ),
              ],
            ),
            const SizedBox(height: 16),
            Slider(
              value: adminAudio.position.inSeconds.toDouble().clamp(0.0, adminAudio.duration.inSeconds.toDouble()),
              max: adminAudio.duration.inSeconds > 0 ? adminAudio.duration.inSeconds.toDouble() : 1.0,
              onChanged: (value) {
                if (mounted) {
                  setState(() {
                    adminAudio.seek(Duration(seconds: value.toInt()));
                  });
                }
              },
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(adminAudio.position.toString().split('.').first),
                Text(adminAudio.duration.toString().split('.').first),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
