import 'package:flutter/material.dart';
import 'package:gen_ai/pages/sos.dart';
import '../util/exercise_tile.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal[50],
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.message), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: ''),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(25.0),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
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
                                    builder: (context) => SosScreen()));
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.orange[600],
                              borderRadius: BorderRadius.circular(12.0),
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
                          width: MediaQuery.of(context).size.width * 0.4,
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
                          child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.sunny,
                                  color: Colors.teal,
                                ),
                                SizedBox(
                                  width: 8,
                                ),
                                Text(
                                  'My Day',
                                  style: TextStyle(
                                      color: Colors.teal, fontSize: 20),
                                )
                              ]),
                        ),
                        Spacer(),
                        Container(
                          width: MediaQuery.of(context).size.width * 0.4,
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
                          child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.music_note,
                                  color: Colors.teal,
                                ),
                                SizedBox(
                                  width: 8,
                                ),
                                Text(
                                  'Chill',
                                  style: TextStyle(
                                      color: Colors.teal, fontSize: 20),
                                )
                              ]),
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
                          child: Image.asset("assets/images/otter.gif",
                              height: 90, width: 80, fit: BoxFit.cover),
                        ),
                        SizedBox(width: 10),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(18.0, 0, 0, 0),
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
                              Container(
                                decoration: BoxDecoration(
                                  color: Colors.teal,
                                  borderRadius: BorderRadius.circular(40),
                                  border: Border.all(
                                    color: Colors.teal.shade100,
                                    width: 2,
                                  ),
                                ),
                                padding: EdgeInsets.all(12),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Chat with Pepo',
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 20),
                                    ),
                                    Icon(
                                      Icons.arrow_forward_rounded,
                                      color: Colors.white,
                                      size: 30,
                                    ),
                                  ],
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
                color: Colors.grey[200],
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Exercises',
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
                    ListView(
                      physics:
                          NeverScrollableScrollPhysics(), // Prevents nested scrolling
                      shrinkWrap: true, // Allow ListView to take minimum height
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
        ),
      ),
    );
  }
}
