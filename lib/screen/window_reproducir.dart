import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:reproductor_flutter/music.dart';
import 'package:reproductor_flutter/audio.dart';

class MusicPlayerScreen extends StatefulWidget {
  final List<Music> playlist;
  final int indiceInicial;

  const MusicPlayerScreen({required this.playlist,
                           required this.indiceInicial, Key? key}) : super(key: key);

  @override
  _MusicPlayerScreenState createState() => _MusicPlayerScreenState();
}

class _MusicPlayerScreenState extends State<MusicPlayerScreen> {
  late AudioPlayer reproductor;
  late Music cancionActual;
  late List<Music> _playlist;
  late AudioManager adminAudio;

  @override
  void initState() {
    super.initState();
    adminAudio = AudioManager();
    _playlist = widget.playlist;
    cancionActual = _playlist[widget.indiceInicial];

    reproductor = adminAudio.reproductor;
    reproductor.onDurationChanged.listen((d) {
      if (mounted) {
        setState(() {
          adminAudio.updateDuration(d);
        });
      }
    });

    reproductor.onPositionChanged.listen((p) {
      if (mounted) {
        setState(() {
          adminAudio.updatePosition(p);
        });
      }
    });

    _playSong(); //inicia la reproducción de la canción al entrar en la vista
  }

  void _playSong() async {
    await reproductor.setSource(DeviceFileSource(cancionActual.filePath));
    await reproductor.resume();
    setState(() {
      adminAudio.updatePlayingStatus(true);
    });
  }

  void _playPause() {
    if (adminAudio.isPlaying) {
      reproductor.pause();
    } else {
      reproductor.resume();
    }

    setState(() {
      adminAudio.updatePlayingStatus(!adminAudio.isPlaying);
    });
  }

  void _nextSong() {
    setState(() {
      int indiceActual = _playlist.indexOf(cancionActual);
      cancionActual = _playlist[(indiceActual + 1) % _playlist.length];
      _playSong();
    });
  }

  void _previousSong() {
    setState(() {
      int indiceActual = _playlist.indexOf(cancionActual);
      cancionActual = _playlist[(indiceActual - 1 + _playlist.length) % _playlist.length];
      _playSong();
    });
  }

  @override
  void dispose() {
    // No llames a reproductor.dispose(), para que siga reproduciendo en segundo plano
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Reproductor de Música GFS'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              cancionActual.titulo,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(
              cancionActual.artista,
              style: const TextStyle(fontSize: 18, color: Colors.grey),
            ),
            const SizedBox(height: 32),
            CircleAvatar(
              radius: 80,
              child: Icon(Icons.music_note, size: 80), // Icono de música
            ),
            const SizedBox(height: 32),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  icon: const Icon(Icons.skip_previous),
                  iconSize: 48,
                  onPressed: _previousSong,
                ),
                IconButton(
                  icon: Icon(adminAudio.isPlaying ? Icons.pause : Icons.play_arrow),
                  iconSize: 64,
                  onPressed: _playPause,
                ),
                IconButton(
                  icon: const Icon(Icons.skip_next),
                  iconSize: 48,
                  onPressed: _nextSong,
                ),
              ],
            ),
            const SizedBox(height: 16),
            Slider(
              value: adminAudio.position.inSeconds.toDouble(),
              max: adminAudio.duration.inSeconds > 0 ? adminAudio.duration.inSeconds.toDouble() : 1.0,
              onChanged: (value) {
                setState(() {
                  reproductor.seek(Duration(seconds: value.toInt()));
                });
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
