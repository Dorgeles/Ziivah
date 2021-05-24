import 'package:flutter/material.dart';
import 'package:ziivah/components/background.component.dart';
import 'package:ziivah/components/image-hodler.component.dart';
import 'package:ziivah/screens/student/components/student-drawer.component.dart';
import 'package:ziivah/screens/student/components/topic-box.component.dart';
import 'package:ziivah/theme/color.theme.dart';

class StudentHomeScreen extends StatefulWidget {
  @override
  _StudentHomeScreenState createState() => _StudentHomeScreenState();
}

class _StudentHomeScreenState extends State<StudentHomeScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Stack(
      children: [
        BackGround(),
        SafeArea(
          child: Scaffold(
            backgroundColor: Colors.transparent,
            key: _scaffoldKey,
            body: Column(
              children: [
                SizedBox(
                  height: 20,
                ),
                Container(
                  color: blue,
                  width: screenSize.width,
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 10),
                        child: ImageHolder(
                          size: 60,
                        ),
                      ),
                      Column(
                        children: [
                          Text(
                            "Wifisan Aslan Dje Bi",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                          ),
                          Text(
                            "Eleve en classe de 5 eme",
                            style: TextStyle(
                              fontSize: 10,
                              color: dark,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 40,
                ),
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        TopicBox(
                          screenSize: screenSize,
                          titre: 'Une matière',
                          color: Colors.red,
                        ),
                        TopicBox(
                          screenSize: screenSize,
                          titre: 'Une matière',
                          color: Colors.green,
                        ),
                        TopicBox(
                          screenSize: screenSize,
                          titre: 'Une matière',
                          color: Colors.black,
                        ),
                        TopicBox(
                          screenSize: screenSize,
                          titre: 'Une matière',
                          color: Colors.cyan,
                        ),
                        TopicBox(
                          screenSize: screenSize,
                          titre: 'Une matière',
                          color: Colors.yellow,
                        ),
                        TopicBox(
                          screenSize: screenSize,
                          titre: 'Une matière',
                          color: Colors.pink,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            drawer: StudentDrawer(),
          ),
        )
      ],
    );
  }
}
