import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:ziivah/models/child.model.dart';
import 'package:ziivah/theme/color.theme.dart';

import 'image-hodler.component.dart';

class StudentItem extends StatefulWidget {
  final Child child;
  const StudentItem({
    Key key,
    @required this.screenSize,
    this.child,
  }) : super(key: key);

  final Size screenSize;

  @override
  _StudentItemState createState() => _StudentItemState();
}

class _StudentItemState extends State<StudentItem> {
  bool isDisplay = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 5),
      child: Column(
        children: [
          GestureDetector(
            behavior: HitTestBehavior.translucent,
            onTap: () {
              print("lkjqdsfldskjf");
              setState(() {
                isDisplay = !isDisplay;
              });
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Container(
                height: 50,
                width: widget.screenSize.width,
                child: Row(
                  // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: 30,
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.person_outline_outlined,
                          size: 40,
                          color: dark,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              widget.child.fullname,
                              style: TextStyle(
                                fontSize: 16,
                                color: dark,
                              ),
                            ),
                            Text(
                              widget.child.grade,
                              style: TextStyle(
                                fontSize: 12,
                                color: dark,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Spacer(),
                    Icon(
                      !isDisplay ? LineIcons.list : Icons.line_style_sharp,
                      size: 30,
                      color: dark,
                    ),
                    SizedBox(
                      width: 12,
                    ),
                  ],
                ),
              ),
            ),
          ),
          isDisplay
              ? Padding(
                  padding:
                      const EdgeInsets.only(left: 20, right: 20, bottom: 20),
                  child: Column(
                    children: [
                      Divider(
                        color: dark,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                            height: 130,
                            width: 130,
                            decoration: BoxDecoration(
                              border: Border.all(color: dark, width: 1),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.asset(
                                  "assets/decision-making.png",
                                  fit: BoxFit.cover,
                                  height: 80,
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Container(
                                  height: 20,
                                  width: 100,
                                  decoration: BoxDecoration(
                                    color: primary,
                                    borderRadius: BorderRadius.circular(4),
                                  ),
                                  child: Center(
                                    child: Text('Quizz'),
                                  ),
                                )
                              ],
                            ),
                          ),
                          Container(
                            height: 130,
                            width: 130,
                            decoration: BoxDecoration(
                              border: Border.all(color: dark, width: 1),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.asset(
                                  "assets/pie-chart.png",
                                  fit: BoxFit.cover,
                                  height: 80,
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Container(
                                  height: 20,
                                  width: 100,
                                  decoration: BoxDecoration(
                                    color: primary,
                                    borderRadius: BorderRadius.circular(4),
                                  ),
                                  child: Center(
                                    child: Text('Resultats'),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                            height: 130,
                            width: 130,
                            decoration: BoxDecoration(
                              border: Border.all(color: dark, width: 1),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.asset(
                                  "assets/project.png",
                                  fit: BoxFit.cover,
                                  height: 80,
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Container(
                                  height: 20,
                                  width: 100,
                                  decoration: BoxDecoration(
                                    color: primary,
                                    borderRadius: BorderRadius.circular(4),
                                  ),
                                  child: Center(
                                    child: Text('Bulletin'),
                                  ),
                                )
                              ],
                            ),
                          ),
                          Container(
                            height: 130,
                            width: 130,
                            decoration: BoxDecoration(
                              border: Border.all(color: dark, width: 1),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.asset(
                                  "assets/statistics.png",
                                  fit: BoxFit.cover,
                                  height: 80,
                                ),
                                Container(
                                  height: 20,
                                  width: 100,
                                  decoration: BoxDecoration(
                                    color: primary,
                                    borderRadius: BorderRadius.circular(4),
                                  ),
                                  child: Center(
                                    child: Text('Progression'),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                )
              : Container()
        ],
      ),
      decoration:
          BoxDecoration(color: white, borderRadius: BorderRadius.circular(5)),
    );
  }
}
