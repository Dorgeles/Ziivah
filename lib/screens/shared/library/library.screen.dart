import 'package:flutter/material.dart';
import 'package:ziivah/components/background.component.dart';
import 'package:ziivah/theme/color.theme.dart';

class LibraryScreen extends StatefulWidget {
  const LibraryScreen({Key key}) : super(key: key);

  @override
  _LibraryScreenState createState() => _LibraryScreenState();
}

class _LibraryScreenState extends State<LibraryScreen> {
  String subject = "Français";
  List<String> subjectList = [
    "Français",
    "Mathématique",
    "Anglais",
    "Culture",
    "Histoire"
  ];
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        BackGround(),
        SafeArea(
          child: Scaffold(
            backgroundColor: Colors.transparent,
            appBar: AppBar(
              elevation: 0,
              backgroundColor: Colors.transparent,
              leading: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(Icons.menu),
              ),
              title: Text('La librairie'),
            ),
            body: SingleChildScrollView(
              child: Column(
                children: [
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                        children: subjectList.map((subject) {
                      return SubjectText(title: subject);
                    }).toList()),
                  )
                ],
              ),
            ),
          ),
        )
      ],
    );
  }
}

class SubjectText extends StatelessWidget {
  final String title;
  const SubjectText({
    Key key,
    this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0),
      child: Column(
        children: [
          Text(
            title,
            style: TextStyle(
              color: dark.withOpacity(.7),
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(
            height: 5,
          ),
          Container(
            height: 4,
            width: 40,
            color: darkBlue,
          )
        ],
      ),
    );
  }
}
