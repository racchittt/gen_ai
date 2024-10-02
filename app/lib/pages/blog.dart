import 'package:flutter/material.dart';

class BlogScreen extends StatelessWidget {
  final Object data = ([
    {
      'articleTitle': 'The Importance of Sleep',
      'articleImage': 'assets/images/sleep.jpg',
      'articleDetails':
          'Sleep is essential for overall well-being, playing a critical role in physical and mental health. During sleep, the body repairs tissues, strengthens the immune system, and restores energy levels, which are vital for maintaining optimal physical performance and preventing illness. Sleep also supports cognitive functions, such as memory consolidation, learning, and emotional regulation, allowing the brain to process information and manage stress effectively. Consistent, quality sleep enhances problem-solving abilities, creativity, and decision-making, while reducing the risk of mental health issues like anxiety and depression. Lack of sleep impairs attention, reaction times, and judgment, increasing the likelihood of accidents and poor performance in daily tasks. Additionally, insufficient sleep is linked to chronic conditions such as obesity, diabetes, and heart disease, making it crucial for long-term health. Cultivating healthy sleep habits improves mood, productivity, and overall quality of life.',
    },
    {
      'articleTitle': 'Depression: Silent Killer',
      'articleImage': 'assets/images/depression.jpg',
      'articleDetails':
          'Depression is a mood disorder that causes a persistent feeling of sadness and loss of interest. Also called major depressive disorder or clinical depression, it affects how you feel, think and behave and can lead to a variety of emotional and physical problems.',
    },
    {
      'articleTitle': 'Anxiety: The Fear Within',
      'articleImage': 'assets/images/anxiety.webp',
      'articleDetails':
          'Anxiety is your body’s natural response to stress. It’s a feeling of fear or apprehension about what’s to come. The first day of school, going to a job interview, or giving a speech may cause most people to feel fearful and nervous.',
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
        backgroundColor: Colors.teal,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.teal.shade100, Colors.teal.shade50],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Container(
                  height: 200,
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black26,
                        blurRadius: 10,
                        offset: Offset(0, 5),
                      ),
                    ],
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.asset(articleImage, fit: BoxFit.cover),
                  ),
                ),
                SizedBox(height: 20),
                Card(
                  elevation: 5,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          articleTitle,
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Colors.teal.shade900,
                          ),
                        ),
                        SizedBox(height: 10),
                        Divider(color: Colors.teal.shade200),
                        SizedBox(height: 10),
                        Text(
                          articleDetails,
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.normal,
                            color: Colors.teal.shade800,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
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
              height: 200,
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
