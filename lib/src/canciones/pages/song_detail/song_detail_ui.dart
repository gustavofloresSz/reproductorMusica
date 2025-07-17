

import 'package:flutter/material.dart';
import 'package:flutter_testr/src/canciones/pages/song_detail/song_detail_component.dart';

class SongDetailUi extends StatefulWidget {
  final SongDetailComponent component;

  const SongDetailUi({Key? key, required this.component}) : super(key: key);

  @override
  _SongDetailUiState createState() => _SongDetailUiState();
}

class _SongDetailUiState extends State<SongDetailUi> {
  @override
  void initState() {
    super.initState();
    widget.component.audioController.currentSongNotifier.addListener(_refresh);
  }

  @override
  void dispose() {
    widget.component.audioController.currentSongNotifier.removeListener(_refresh);
    super.dispose();
  }

  void _refresh() {
    if (mounted) setState(() {});
  }

  String _formatDuration(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    final minutes = twoDigits(duration.inMinutes.remainder(60));
    final seconds = twoDigits(duration.inSeconds.remainder(60));
    return '$minutes:$seconds';
  }

  @override
  Widget build(BuildContext context) {
    final cancion = widget.component.audioController.currentSongNotifier.value;

    return Scaffold(
      appBar: AppBar(title: Text('Reproduciendo')),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.music_note, size: 100, color: Colors.blue),
            SizedBox(height: 20),
            Text(cancion.titulo, style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            Text(cancion.artista, style: TextStyle(fontSize: 18, color: Colors.grey)),
            SizedBox(height: 40),
            _buildProgressBar(),
            SizedBox(height: 20),
            _buildControlButtons(),
          ],
        ),
      ),
    );
  }

  Widget _buildProgressBar() {
    return ValueListenableBuilder<Duration>(
      valueListenable: widget.component.durationNotifier,
      builder: (context, duration, _) {
        return ValueListenableBuilder<Duration>(
          valueListenable: widget.component.positionNotifier,
          builder: (context, position, _) {
            return Column(
              children: [
                Slider(
                  value: position.inSeconds.toDouble().clamp(0, duration.inSeconds.toDouble()),
                  max: duration.inSeconds.toDouble() > 0 ? duration.inSeconds.toDouble() : 1,
                  onChanged: (value) {
                    widget.component.seek(Duration(seconds: value.toInt()));
                  },
                  activeColor: Colors.blue,
                  inactiveColor: Colors.grey[400],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(_formatDuration(position)),
                    Text(_formatDuration(duration)),
                  ],
                ),
              ],
            );
          },
        );
      },
    );
  }


  Widget _buildControlButtons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(
          icon: Icon(Icons.skip_previous),
          onPressed: widget.component.previousSong,
          iconSize: 48,
        ),
        ValueListenableBuilder<bool>(
          valueListenable: widget.component.audioController.isPlayingNotifier,
          builder: (context, isPlaying, _) {
            return IconButton(
              icon: Icon(isPlaying ? Icons.pause : Icons.play_arrow),
              onPressed: widget.component.playPause,
              iconSize: 64,
            );
          },
        ),
        IconButton(
          icon: Icon(Icons.skip_next),
          onPressed: widget.component.nextSong,
          iconSize: 48,
        ),
      ],
    );
  }
}