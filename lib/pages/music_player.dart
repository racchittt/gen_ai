import 'package:flutter/material.dart';
import 'package:gen_ai/pages/songs.dart';

class MusicPlayerPage extends StatelessWidget {
  final List<Map<String, dynamic>> categories = [
    {'title': 'Nature', 'image': 'assets/images/nature.jpg', 'songs': ['assets/songs/nature1.mp3', 'assets/songs/nature2.mp3']},
    {'title': 'White Noise', 'image': 'assets/images/whitenoise.jpg', 'songs': ['assets/songs/whitenoise1.mp3', 'assets/songs/whitenoise2.mp3']},
    {'title': 'Binaural', 'image': 'assets/images/binaural.jpg', 'songs': ['assets/songs/binaural1.mp3', 'assets/songs/binaural2.mp3']},
    {'title': 'Artist', 'image': 'assets/images/artist.jpg', 'songs': ['assets/songs/artist1.mp3', 'assets/songs/artist2.mp3']},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Music Player'),
        backgroundColor: Colors.teal, // Green 300 color
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.builder(
          itemCount: categories.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 10,
            crossAxisSpacing: 10,
          ),
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SongListPage(
                      title: categories[index]['title'],
                      songs: categories[index]['songs'],
                    ),
                  ),
                );
              },
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                elevation: 5,
                child: Stack(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child: Image.asset(
                        categories[index]['image'],
                        fit: BoxFit.cover,
                        width: double.infinity,
                        height: double.infinity,
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        gradient: LinearGradient(
                          colors: [Colors.black.withOpacity(0.6), Colors.transparent],
                          begin: Alignment.bottomCenter,
                          end: Alignment.topCenter,
                        ),
                      ),
                      alignment: Alignment.bottomCenter,
                      padding: EdgeInsets.all(10),
                      child: Text(
                        categories[index]['title'],
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
