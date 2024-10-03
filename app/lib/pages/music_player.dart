import 'package:flutter/material.dart';
import 'package:genai/pages/dashboard.dart';
import 'package:genai/pages/song_player.dart';
import 'dart:math';

class MusicPlayerPage extends StatefulWidget {
  @override
  _MusicPlayerPageState createState() => _MusicPlayerPageState();
}

class _MusicPlayerPageState extends State<MusicPlayerPage> {
  final List<Map<String, dynamic>> categories = [
    {
      'title': 'Nature',
      'image':
          'https://res.cloudinary.com/duknzh3qe/image/upload/v1727817934/leaf_a5zvcf.jpg',
      'names': ['Nature Walk', 'Nature Calls'],
      'songs': [
        'https://res.cloudinary.com/duknzh3qe/video/upload/v1727818636/nature1_g9oi6l.mp3',
        'https://res.cloudinary.com/duknzh3qe/video/upload/v1727818624/nature2_qptiix.mp3'
      ],
      'path':
          'https://res.cloudinary.com/duknzh3qe/image/upload/v1727817936/nature_bg_urkvoo.webp'
    },
    {
      'title': 'Instrumental',
      'image':
          'https://res.cloudinary.com/duknzh3qe/image/upload/v1727817934/instrument_fgk11y.jpg',
      'names': ['Violins', 'Mix'],
      'songs': [
        'https://res.cloudinary.com/duknzh3qe/video/upload/v1727818623/instrument1_gcepby.mp3',
        'https://res.cloudinary.com/duknzh3qe/video/upload/v1727818632/instrument2_gnmche.mp3'
      ],
      'path':
          'https://res.cloudinary.com/duknzh3qe/image/upload/v1727817934/instrument_fgk11y.jpg'
    },
    {
      'title': 'Binaural',
      'image':
          'https://res.cloudinary.com/duknzh3qe/image/upload/v1727817935/bin_eoeoie.png',
      'names': ['3 Hz', '1 Hz'],
      'songs': [
        'https://res.cloudinary.com/duknzh3qe/video/upload/v1727818630/binaural1_pz5a7q.mp3',
        'https://res.cloudinary.com/duknzh3qe/video/upload/v1727818623/binaural2_hwdnht.mp3'
      ],
      'path':
          'https://res.cloudinary.com/duknzh3qe/image/upload/v1727817935/binaural_bg_m0ia29.gif'
    },
    {
      'title': 'Artist',
      'image':
          'https://res.cloudinary.com/duknzh3qe/image/upload/v1727817934/art_nhi71m.jpg',
      'names': ['Nature Walk', 'Nature Calls'],
      'songs': [
        'https://res.cloudinary.com/duknzh3qe/video/upload/v1727818620/artist1_itgttb.mp3',
        'https://res.cloudinary.com/duknzh3qe/video/upload/v1727818621/artist2_vrew89.mp3'
      ],
      'path':
          'https://res.cloudinary.com/duknzh3qe/image/upload/v1727817934/art_nhi71m.jpg'
    },
  ];

  List<double> _opacityList = [];

  @override
  void initState() {
    super.initState();
    // Initialize opacity list with 0
    _opacityList = List<double>.filled(categories.length, 0.0);
    _animateGridItems();
  }

  void _animateGridItems() async {
    for (int i = 0; i < categories.length; i++) {
      await Future.delayed(Duration(milliseconds: 300)); // Delay for effect
      setState(() {
        _opacityList[i] = 1.0; // Fade in effect
      });
    }
  }

  Future<bool> _onWillPop(BuildContext context) async {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => DashboardPage(),
      ),
    );
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   backgroundColor: Colors.teal,
      // ),
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
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.fromLTRB(0, 20, 20, 20),
                margin: const EdgeInsets.fromLTRB(5, 20, 5, 0),
                child: Text(
                  'Listen to \ntherapy music ..',
                  style: TextStyle(
                    color: Colors.teal,
                    fontFamily: 'Poppins',
                    fontSize: 30,
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
                    return AnimatedOpacity(
                      opacity: _opacityList[index],
                      duration: Duration(
                          milliseconds: 500), // Duration of the fade-in effect
                      child: GestureDetector(
                        onTap: () {
                          // Select a random song from the category
                          int randomIndex = Random()
                              .nextInt(categories[index]['songs'].length);

                          // Navigate directly to the song player page with the random song
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => SongPlayerPage(
                                songPath: categories[index]['songs']
                                    [randomIndex],
                                songName: categories[index]['names']
                                    [randomIndex],
                                catName: categories[index]['path'],
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
                                child: Image.network(
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
                                      Colors.transparent,
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
