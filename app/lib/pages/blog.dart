import 'package:flutter/material.dart';

class BlogScreen extends StatelessWidget {
  final Object data = ([
    {
      'articleTitle': 'The Importance of Sleep',
      'articleImage': 'assets/images/nature.jpg',
      'articleDetails':
          'Sleep is important for various aspects of brain function. This includes cognition, concentration, productivity, and performance. All of these are negatively affected by sleep deprivation.',
    },
    {
      'articleTitle': 'The Importance of depression',
      'articleImage': 'assets/images/nature.jpg',
      'articleDetails':
          'Depression is a mood disorder that causes a persistent feeling of sadness and loss of interest. Also called major depressive disorder or clinical depression, it affects how you feel, think and behave and can lead to a variety of emotional and physical problems.',
    },
    {
      'articleTitle': 'The Importance of anxiety',
      'articleImage': 'assets/images/nature.jpg',
      'articleDetails':
          'Anxiety is your body’s natural response to stress. It’s a feeling of fear or apprehension about what’s to come. The first day of school, going to a job interview, or giving a speech may cause most people to feel fearful and nervous.',
    },
    {
      'articleTitle': 'The Importance of bpd',
      'articleImage': 'assets/images/nature.jpg',
      'articleDetails':
          'Borderline personality disorder (BPD) is a serious mental disorder marked by a pattern of ongoing instability in moods, behavior, self-image, and functioning. These experiences often result in impulsive actions and unstable relationships.',
    },
  ]);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal[200],
        elevation: 0,
        centerTitle: true,
        title: Text(
          'Blogs',
          style: TextStyle(
            color: Colors.black,
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.teal[100]!,
              Colors.teal[100]!,
            ],
          ),
        ),
        child: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'All Articles',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      )
                    ],
                  ),
                  Column(
                    children:
                        (data as List<Map<String, String>>).map((article) {
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 16.0),
                        child: ArticleCard(
                          articleTitle: article['articleTitle']!,
                          articleImage: article['articleImage']!,
                          articleDetails: article['articleDetails']!,
                        ),
                      );
                    }).toList(),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class ArticleDetailScreen extends StatelessWidget {
  final String articleImage;
  final String articleTitle;
  final String articleDetails;

  const ArticleDetailScreen({
    super.key,
    required this.articleImage,
    required this.articleTitle,
    required this.articleDetails,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(articleTitle),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              height: 200, // Specify the height you want for the image
              child: Image.asset(articleImage, fit: BoxFit.cover),
            ),
            SizedBox(height: 20),
            Text(
              articleTitle,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              articleDetails,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.normal),
            ),
          ],
        ),
      ),
    );
  }
}

class ArticleCard extends StatelessWidget {
  final String articleImage;
  final String articleTitle;
  final String articleDetails;

  const ArticleCard({
    super.key,
    required this.articleImage,
    required this.articleTitle,
    required this.articleDetails,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ArticleDetailScreen(
              articleImage: articleImage,
              articleTitle: articleTitle,
              articleDetails: articleDetails,
            ),
          ),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              spreadRadius: 2,
              blurRadius: 5,
              offset: Offset(0, 3),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              height: 200, // Specify the height you want for the image
              child: Image.asset(articleImage, fit: BoxFit.cover),
            ),
            SizedBox(height: 10),
            Container(
              decoration: BoxDecoration(
                color: Colors.grey[100],
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  articleTitle,
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
