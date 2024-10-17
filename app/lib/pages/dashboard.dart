import 'package:flutter/material.dart';
import 'package:genai/components/horizontal_cards.dart';
import 'package:genai/pages/blog.dart';
import 'package:genai/pages/breathe.dart';
import 'package:genai/pages/cards.dart';
import 'package:genai/pages/cbt/disclaimer.dart';
import 'package:genai/pages/chat_screen.dart';
import 'package:genai/pages/community.dart';
import 'package:genai/pages/contact_professionals.dart';
import 'package:genai/pages/journal.dart';
import 'package:genai/pages/meditation.dart';
import 'package:genai/pages/mood.dart';
import 'package:genai/pages/music_player.dart';
import 'package:genai/pages/sos.dart';
import 'package:genai/services/auth_service.dart';
import '../util/exercise_tile.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  int _selectedIndex = 0;

  final List<Widget> _screens = [
    DashboardPage(),
    CommunityPage(),
    // ProfileScreen(),
    FlashCard(),
  ];

  void _onItemTapped(int index) {
    if (_selectedIndex == index) return;
    setState(() {
      _selectedIndex = index;
    });

    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => _screens[index]),
    );
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
    return WillPopScope(
      onWillPop: () => _onWillPop(context),
      child: Scaffold(
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
        child: Stack(
          children: [
            Scaffold(
              backgroundColor: Colors.transparent,
              body: SafeArea(
                child: IndexedStack(
                  index: _selectedIndex,
                  children: [
                    SingleChildScrollView(
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 60),
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(25.0),
                              child: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'Hello Rachit!',
                                            style: TextStyle(
                                              color: Colors.teal[600],
                                              fontSize: 24,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          SizedBox(
                                            height: 8,
                                          )
                                        ],
                                      ),
                                      InkWell(
                                        onTap: () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      SosScreen()));
                                        },
                                        child: Container(
                                          decoration: BoxDecoration(
                                            color: Colors.orange[600],
                                            borderRadius:
                                                BorderRadius.circular(12.0),
                                          ),
                                          padding: EdgeInsets.all(12.0),
                                          child: Icon(
                                            Icons.sos,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                      IconButton(
                                        icon: const Icon(Icons.logout),
                                        onPressed: () {
                                          AuthService().logout(context);
                                        },
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 25,
                                  ),
                                  Row(
                                    children: [
                                      Container(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.4,
                                        height: 60,
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(40),
                                          border: Border.all(
                                            color: Colors.teal.shade600,
                                            width: 2,
                                          ),
                                        ),
                                        padding: EdgeInsets.all(12),
                                        child: GestureDetector(
                                          onTap: () {
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        Journal()));
                                          },
                                          child: Row(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Icon(
                                                  Icons.sunny,
                                                  color: Colors.teal,
                                                ),
                                                SizedBox(
                                                  width: 8,
                                                ),
                                                Text(
                                                  'Journal',
                                                  style: TextStyle(
                                                      color: Colors.teal,
                                                      fontSize: 20),
                                                )
                                              ]),
                                        ),
                                      ),
                                      Spacer(),
                                      Container(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.4,
                                        height: 60,
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(40),
                                          border: Border.all(
                                            color: Colors.teal.shade600,
                                            width: 2,
                                          ),
                                        ),
                                        padding: EdgeInsets.all(12),
                                        child: GestureDetector(
                                          onTap: () {
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      MoodScreen()),
                                            );
                                          },
                                          child: Row(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Icon(
                                                  Icons.select_all,
                                                  color: Colors.teal,
                                                ),
                                                SizedBox(
                                                  width: 8,
                                                ),
                                                Text(
                                                  'Mood',
                                                  style: TextStyle(
                                                      color: Colors.teal,
                                                      fontSize: 20),
                                                )
                                              ]),
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 25,
                                  ),
                                  Row(
                                    children: [
                                      Container(
                                        alignment: Alignment.center,
                                        child: Image.asset(
                                            "assets/images/otter.gif",
                                            height: 90,
                                            width: 80,
                                            fit: BoxFit.cover),
                                      ),
                                      SizedBox(width: 10),
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Padding(
                                              padding:
                                                  const EdgeInsets.fromLTRB(
                                                      18.0, 0, 0, 0),
                                              child: Text(
                                                'Pepo loves to talk!',
                                                style: TextStyle(
                                                  color: Colors.teal[600],
                                                  fontSize: 22,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                              height: 10,
                                            ),
                                            GestureDetector(
                                              onTap: () {
                                                Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                        builder: (context) =>
                                                            ChatScreen()));
                                              },
                                              child: Container(
                                                decoration: BoxDecoration(
                                                  color: Colors.teal,
                                                  borderRadius:
                                                      BorderRadius.circular(40),
                                                  border: Border.all(
                                                    color: Colors.teal.shade100,
                                                    width: 2,
                                                  ),
                                                ),
                                                padding: EdgeInsets.symmetric(
                                                    vertical: 12,
                                                    horizontal: 16),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Text(
                                                      'Chat with Pepo',
                                                      style: TextStyle(
                                                          color: Colors.white,
                                                          fontSize: 20),
                                                    ),
                                                    Icon(
                                                      Icons
                                                          .arrow_forward_rounded,
                                                      color: Colors.white,
                                                      size: 30,
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 25,
                            ),
                            Container(
                              padding: EdgeInsets.all(25),
                              child: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'Looking for something?',
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20,
                                        ),
                                      ),
                                      Icon(Icons.more_horiz),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  HorizontalCards(items: [
                                    CardItem(
                                        icon: Icons.self_improvement_sharp,
                                        label: 'Meditate',
                                        path: MeditationScreen()),
                                    CardItem(
                                        icon: Icons.music_note,
                                        label: 'Music',
                                        path: MusicPlayerPage()),
                                    CardItem(
                                        icon: Icons.air,
                                        label: 'Breathe',
                                        path: BreathingScreen()),
                                    CardItem(
                                        icon: Icons.book,
                                        label: 'CBT',
                                        path: Disclaimer()),
                                  ]),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Container(
                                    alignment: Alignment.centerLeft,
                                    child: Text(
                                      'Explore',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20,
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  ListView(
                                    physics: NeverScrollableScrollPhysics(),
                                    shrinkWrap: true,
                                    children: [
                                      ExerciseTile(
                                          icon: Icons.favorite,
                                          exerciseName: 'Blogs',
                                          numberOfExercise: 16,
                                          color: Colors.orange,
                                          onTap: () {
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        BlogScreen()));
                                          }),
                                      ExerciseTile(
                                          icon: Icons.person,
                                          exerciseName: 'Contact Professionals',
                                          numberOfExercise: 8,
                                          color: Colors.green,
                                          onTap: () {
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        ContactProfessionals()));
                                          }),
                                    ],
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            Positioned(
              left: 0,
              right: 0,
              bottom: 0,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.transparent,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10.0),
                    topRight: Radius.circular(10.0),
                  ),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10.0),
                    topRight: Radius.circular(10.0),
                  ),
                  child: CustomBottomNavBar(
                    selectedIndex: _selectedIndex,
                    onItemSelected: _onItemTapped,
                  ),
                ),
              ),
            ),
          ],
        ),
      )),
    );
  }
}

class CustomBottomNavBar extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onItemSelected;

  const CustomBottomNavBar({
    Key? key,
    required this.selectedIndex,
    required this.onItemSelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(40),
      ),
      height: 80,
      margin: EdgeInsets.fromLTRB(10, 0, 10, 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _buildNavItem(Icons.home, 0),
          _buildNavItem(Icons.chat_bubble_outline, 1),
          _buildNavItem(Icons.bar_chart, 2),
        ],
      ),
    );
  }

  Widget _buildNavItem(IconData icon, int index) {
    return IconButton(
      icon: Icon(
        icon,
        color: selectedIndex == index ? Colors.black : Colors.grey,
      ),
      onPressed: () => onItemSelected(index),
    );
  }
}
