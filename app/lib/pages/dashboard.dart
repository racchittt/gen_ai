import 'package:flutter/material.dart';
import 'package:gen_ai/components/horizontal_cards.dart';
import 'package:gen_ai/pages/breathe.dart';
import 'package:gen_ai/pages/cards.dart';
import 'package:gen_ai/pages/cbt/disclaimer.dart';
import 'package:gen_ai/pages/chat_screen.dart';
import 'package:gen_ai/pages/community.dart';
import 'package:gen_ai/pages/journal.dart';
import 'package:gen_ai/pages/meditation.dart';
import 'package:gen_ai/pages/mood.dart';
import 'package:gen_ai/pages/music_player.dart';
import 'package:gen_ai/pages/sos.dart';
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
    setState(() {
      _selectedIndex = index;
    });

    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => _screens[index]),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
            child: Scaffold(
              backgroundColor: Colors.transparent,
              bottomNavigationBar: Container(
                decoration: BoxDecoration(
                  color: Colors.transparent,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10.0),
                    topRight: Radius.circular(10.0),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black26,
                      blurRadius: 10,
                      spreadRadius: 2,
                      offset: Offset(0, 5),
                    ),
                  ],
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10.0),
                    topRight: Radius.circular(10.0),
                  ),
                  child: BottomNavigationBar(
                    currentIndex: _selectedIndex,
                    onTap: _onItemTapped,
                    backgroundColor: Colors.white,
                    selectedItemColor: Colors.teal[700],
                    unselectedItemColor: Colors.teal[600],
                    showSelectedLabels: true,
                    showUnselectedLabels: false,
                    selectedLabelStyle: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                    type: BottomNavigationBarType.fixed,
                    items: [
                      BottomNavigationBarItem(
                        icon: Icon(Icons.home),
                        label: 'Home',
                      ),
                      BottomNavigationBarItem(
                        icon: Icon(Icons.message),
                        label: 'Messages',
                      ),
                      BottomNavigationBarItem(
                        icon: Icon(Icons.card_membership),
                        label: 'Cards',
                      ),
                    ],
                    selectedIconTheme: IconThemeData(
                      size: 30,
                    ),
                    unselectedIconTheme: IconThemeData(
                      size: 25,
                    ),
                  ),
                ),
              ),
              body: SafeArea(
                child: IndexedStack(
                  index: _selectedIndex,
                  children: [
                    SingleChildScrollView(
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
                                          'Hello Bablu !',
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
                                    )
                                  ],
                                ),
                                SizedBox(
                                  height: 25,
                                ),
                                Row(
                                  children: [
                                    Container(
                                      width: MediaQuery.of(context).size.width *
                                          0.4,
                                      height: 60,
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(40),
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
                                      width: MediaQuery.of(context).size.width *
                                          0.4,
                                      height: 60,
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(40),
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
                                                Icons.mood,
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
                                            padding: const EdgeInsets.fromLTRB(
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
                                                  vertical: 12, horizontal: 16),
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
                                                    Icons.arrow_forward_rounded,
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
                                      icon: Icons.card_giftcard,
                                      label: 'Cards',
                                      path: FlashCard()),
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
                                    'Exercises',
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
                                      exerciseName: 'Help me Meditate',
                                      numberOfExercise: 16,
                                      color: Colors.orange,
                                    ),
                                    ExerciseTile(
                                      icon: Icons.person,
                                      exerciseName: 'Feel Good Music',
                                      numberOfExercise: 8,
                                      color: Colors.green,
                                    ),
                                    ExerciseTile(
                                      icon: Icons.star,
                                      exerciseName: 'Today\'s List',
                                      numberOfExercise: 20,
                                      color: Colors.pink,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            )));
  }
}
