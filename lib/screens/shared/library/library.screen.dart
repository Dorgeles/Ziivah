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
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 12.0),
                    child: Container(
                      height: 290,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: dark.withOpacity(0.5),
                            // spreadRadius: 5,
                            blurRadius: 10,
                            offset: Offset(0, 3), // changes position of shadow
                          ),
                        ],
                        color: primary,
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(20),
                            topLeft: Radius.circular(20)),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(
                            left: 20.0, top: 20.0, bottom: 20.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Tendances",
                                      style: TextStyle(
                                        color: dark,
                                        fontSize: 22,
                                      ),
                                    ),
                                    Text(
                                      "Les meilleurs ventes du moment",
                                      style: TextStyle(
                                        color: Colors.grey,
                                        fontSize: 12,
                                      ),
                                    ),
                                  ],
                                ),
                                Spacer(),
                                TextButton(
                                    onPressed: () {},
                                    child: Text(
                                      "Plus",
                                      style: TextStyle(
                                        color: Colors.grey,
                                        fontSize: 12,
                                      ),
                                    ))
                              ],
                            ),
                            SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Row(
                                children: [
                                  BookView(),
                                  BookView(),
                                  BookView(),
                                  BookView(),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 13,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Text(
                      "Catégories",
                      style: TextStyle(
                        color: dark,
                        fontSize: 22,
                      ),
                    ),
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                        children: subjectList.map((subject) {
                      return CategoryBook(
                        label: subject,
                      );
                    }).toList()),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width - 50,
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

class CategoryBook extends StatelessWidget {
  final String label;
  const CategoryBook({
    Key key,
    this.label,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Container(
        height: 100,
        width: 120,
        decoration: BoxDecoration(
          color: primary,
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
              color: dark.withOpacity(0.5),
              // spreadRadius: 5,
              blurRadius: 10,
              offset: Offset(0, 3), // changes position of shadow
            ),
          ],
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.graphic_eq_outlined,
                color: Colors.grey,
              ),
              SizedBox(
                height: 3,
              ),
              Text(
                label,
                style: TextStyle(
                  color: Colors.grey,
                  fontWeight: FontWeight.bold,
                  fontSize: 12,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                '20 livres',
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 12,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class BookView extends StatelessWidget {
  const BookView({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 8.0),
      child: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 150,
              width: 110,
              decoration: BoxDecoration(
                color: dark,
                borderRadius: BorderRadius.circular(5),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "editeur du livre",
              style: TextStyle(
                color: Colors.grey,
                fontSize: 12,
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Container(
              width: 125,
              child: Text(
                "Titre du livre",
                style: TextStyle(
                  color: dark,
                  fontSize: 16,
                ),
                overflow: TextOverflow.ellipsis,
              ),
            )
          ],
        ),
      ),
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
