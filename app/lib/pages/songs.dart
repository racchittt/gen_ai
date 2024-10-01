import 'package:flutter/material.dart';
import 'package:gen_ai/pages/song_player.dart';

class SongListPage extends StatelessWidget {
  SongListPage({required this.title, required this.songs});

  final String title;
  final List<String> songs;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('$title Songs'),
        backgroundColor: Colors.teal, // Same green color
      ),
      body: ListView.builder(
        itemCount: songs.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text('Song ${index + 1}'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => SongPlayerPage(
                    songPath: songs[index],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
