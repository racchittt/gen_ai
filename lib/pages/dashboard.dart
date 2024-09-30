import 'package:flutter/material.dart';
import 'package:gen_ai/pages/sos.dart';
import '../util/exercise_tile.dart';

class HorizontalCards extends StatelessWidget {
  final List<CardItem> items;

  HorizontalCards({required this.items});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: items.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              width: 120,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.3),
                    spreadRadius: 2,
                    blurRadius: 5,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    items[index].icon,
                    size: 40,
                    color: Colors.teal,
                  ),
                  SizedBox(height: 10),
                  Text(
                    items[index].label,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.teal[600],
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class CardItem {
  final IconData icon;
  final String label;

  CardItem({required this.icon, required this.label});
}

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  List<CardItem> cardItems = [
    CardItem(icon: Icons.self_improvement_sharp, label: 'Meditate'),
    CardItem(icon: Icons.fitness_center, label: 'Workout'),
    CardItem(icon: Icons.fastfood, label: 'Healthy Food'),
    CardItem(icon: Icons.music_note, label: 'Music'),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal[50],
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
                icon: Icon(Icons.person),
                label: 'Profile',
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
                          'Quick Refresh',
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
                    HorizontalCards(items: cardItems),
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
        ),
      ),
    );
  }
}
