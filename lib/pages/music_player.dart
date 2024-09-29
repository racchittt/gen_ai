import 'package:flutter/material.dart';
import 'package:gen_ai/pages/songs.dart';

class MusicPlayerPage extends StatelessWidget {
  final List<Map<String, dynamic>> categories = [
    {
      'title': 'Nature',
      'image': 'assets/images/leaf.jpg',
      'songs': ['songs/nature1.mp3', 'songs/nature2.mp3']
    },
    {
      'title': 'White Noise',
      'image': 'assets/images/white.webp',
      'songs': ['songs/whitenoise1.mp3', 'songs/whitenoise2.mp3']
    },
    {
      'title': 'Binaural',
      'image': 'assets/images/bin.png',
      'songs': ['songs/binaural1.mp3', 'songs/binaural2.mp3']
    },
    {
      'title': 'Artist',
      'image': 'assets/images/art.jpg',
      'songs': ['songs/artist1.mp3', 'songs/artist2.mp3']
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.teal, // Darker shade
              Color(0xFFB2E6B2), // Mint green (lighter shade)
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                    vertical: 20.0), // Add some vertical space
                child: Text(
                  'Listen to therapy music',
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: ,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Expanded(
                child: GridView.builder(
                  itemCount: categories.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 20,
                    crossAxisSpacing: 20,
                    childAspectRatio: 1 / 1.6,
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
                                  colors: [
                                    Colors.black.withOpacity(0.6),
                                    Colors.transparent
                                  ],
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
            ],
          ),
        ),
      ),
    );
  }
}
