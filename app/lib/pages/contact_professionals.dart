import 'package:flutter/material.dart';
import 'package:genai/pages/dashboard.dart';

class ContactProfessionals extends StatelessWidget {
  final Object data = ([
    {
      'doctorName': 'Dr. Elena Gray',
      'doctorImage': 'assets/images/doctor.png',
      'doctorSpecialization': 'Anxiety Expert',
      'doctorExperience': '50m',
      'doctorRating': 4.5,
      'doctorRatingCount': 1200,
      'doctorRatingPercentage': 99.57,
    },
    {
      'doctorName': 'Dr. Phos Gray',
      'doctorImage': 'assets/images/doctor.png',
      'doctorSpecialization': 'Anxiety Expert',
      'doctorExperience': '50m',
      'doctorRating': 4.5,
      'doctorRatingCount': 1200,
      'doctorRatingPercentage': 99.57,
    },
    {
      'doctorName': 'Dr. Elena Gray',
      'doctorImage': 'assets/images/doctor.png',
      'doctorSpecialization': 'Anxiety Expert',
      'doctorExperience': '50m',
      'doctorRating': 4.5,
      'doctorRatingCount': 1200,
      'doctorRatingPercentage': 99.57,
    },
    {
      'doctorName': 'Dr. Phos Gray',
      'doctorImage': 'assets/images/doctor.png',
      'doctorSpecialization': 'Anxiety Expert',
      'doctorExperience': '50m',
      'doctorRating': 4.5,
      'doctorRatingCount': 1200,
      'doctorRatingPercentage': 99.57,
    },
    {
      'doctorName': 'Dr. Phos Gray',
      'doctorImage': 'assets/images/doctor.png',
      'doctorSpecialization': 'Anxiety Expert',
      'doctorExperience': '50m',
      'doctorRating': 4.5,
      'doctorRatingCount': 1200,
      'doctorRatingPercentage': 99.57,
    }
  ]);
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
    return WillPopScope(
      onWillPop: () => _onWillPop(context),
      child: Scaffold(
          appBar: AppBar(
            title: Text('Contact Professionals'),
          ),
          body: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.teal[100]!,
                  Colors.grey[200]!,
                ],
              ),
            ),
            // child: Column(
            //           children:
            //               (data as List<Map<String, String>>).map((article) {
            //             return Padding(
            //               padding: const EdgeInsets.only(bottom: 16.0),
            //               child: ArticleCard(
            //                 articleTitle: article['articleTitle']!,
            //                 articleImage: article['articleImage']!,
            //                 articleDetails: article['articleDetails']!,
            //               ),
            //             );
            //           }).toList(),
            //         ),
            child: Column(
              children: [
                Expanded(
                  child: ListView(
                    children:
                        (data as List<Map<String, dynamic>>).map((doctor) {
                      return DoctorProfileCard(
                        doctorName: doctor['doctorName']!,
                        doctorImage: doctor['doctorImage']!,
                        doctorSpecialization: doctor['doctorSpecialization']!,
                        doctorExperience: doctor['doctorExperience']!,
                        doctorRating: doctor['doctorRating']!,
                        doctorRatingCount: doctor['doctorRatingCount']!,
                        doctorRatingPercentage:
                            doctor['doctorRatingPercentage']!,
                      );
                    }).toList(),
                  ),
                )
              ],
            ),
          )),
    );
  }
}

class DoctorProfileCard extends StatelessWidget {
  final String doctorName;
  final String doctorImage;
  final String doctorSpecialization;
  final String doctorExperience;
  final double doctorRating;
  final int doctorRatingCount;
  final double doctorRatingPercentage;

  const DoctorProfileCard({
    super.key,
    required this.doctorName,
    required this.doctorImage,
    required this.doctorSpecialization,
    required this.doctorExperience,
    required this.doctorRating,
    required this.doctorRatingCount,
    required this.doctorRatingPercentage,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Color.fromARGB(255, 255, 255, 255).withOpacity(0.9),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        children: [
          Container(
            child: Row(
              children: [
                CircleAvatar(
                  radius: 30,
                  backgroundImage: AssetImage(doctorImage),
                ),
                SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            'Dr. Phos Gray',
                            style: TextStyle(
                              color: const Color.fromARGB(255, 0, 0, 0),
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(width: 4),
                          Icon(Icons.verified, color: Colors.orange, size: 20),
                        ],
                      ),
                      SizedBox(height: 4),
                      Row(
                        children: [
                          Icon(Icons.psychology, color: Colors.grey, size: 16),
                          SizedBox(width: 4),
                          Text(
                            'Anxiety Expert',
                            style: TextStyle(
                                color: const Color.fromARGB(255, 125, 125, 125),
                                fontSize: 14),
                          ),
                          SizedBox(width: 8),
                          Icon(Icons.access_time, color: Colors.grey, size: 16),
                          SizedBox(width: 4),
                          Text(
                            '50m',
                            style: TextStyle(color: Colors.grey, fontSize: 14),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Icon(Icons.star, color: Colors.yellow, size: 20),
                  SizedBox(width: 4),
                  Text(
                    '4.5',
                    style: TextStyle(
                        color: const Color.fromARGB(255, 86, 86, 86),
                        fontSize: 16),
                  ),
                  Text(
                    ' (1.2k)',
                    style: TextStyle(color: Colors.grey, fontSize: 16),
                  ),
                ],
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                decoration: BoxDecoration(
                  color: Color(0xFF7A49FF),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                  children: [
                    Icon(Icons.call, color: Colors.white, size: 16),
                    SizedBox(width: 4),
                    Text(
                      'Contact',
                      style: TextStyle(color: Colors.white, fontSize: 14),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
