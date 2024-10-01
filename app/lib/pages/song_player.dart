import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

class SongPlayerPage extends StatefulWidget {
  final String songPath;

  SongPlayerPage({required this.songPath});

  @override
  _SongPlayerPageState createState() => _SongPlayerPageState();
}

class _SongPlayerPageState extends State<SongPlayerPage> {
  final AudioPlayer _audioPlayer = AudioPlayer();
  bool isPlaying = false;

  @override
  void dispose() {
    _audioPlayer.dispose();
    super.dispose();
  }

  void _togglePlayPause() async {
    if (isPlaying) {
      await _audioPlayer.pause();
    } else {
      print(widget.songPath);
      await _audioPlayer.play(AssetSource(widget.songPath));
    }
    setState(() {
      isPlaying = !isPlaying;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Now Playing'),
        centerTitle: true,
        backgroundColor: Colors.teal[100],
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.teal[100]!,
              Colors.grey[200]!,
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Playing: ${widget.songPath}',
                style: TextStyle(fontSize: 24),
              ),
              SizedBox(height: 20),
              IconButton(
                iconSize: 64,
                icon: Icon(isPlaying ? Icons.pause : Icons.play_arrow),
                onPressed: _togglePlayPause,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
