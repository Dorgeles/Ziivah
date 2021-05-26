import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:ziivah/theme/color.theme.dart';

import 'image-hodler.component.dart';

class StudentItem extends StatefulWidget {
  final String name;
  final String classe;
  final String schoolName;
  const StudentItem({
    Key key,
    @required this.screenSize,
    this.name,
    this.classe,
    this.schoolName,
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
      color: white,
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
                        size: 50,
                        color: dark,
                      ),
                      Text(
                        widget.name,
                        style: TextStyle(
                          fontSize: 20,
                          color: dark,
                        ),
                      ),
                    ],
                  ),
                  Spacer(),
                  Icon(
                    !isDisplay ? LineIcons.list : Icons.line_style_sharp,
                    size: 50,
                    color: dark,
                  ),
                  SizedBox(
                    width: 12,
                  ),
                ],
              ),
            ),
          ),
          !isDisplay
              ? Divider(
                  color: blue,
                )
              : Container(),
          isDisplay
              ? Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 40),
                  child: Column(
                    children: [
                      Divider(
                        color: dark,
                      ),
                      Row(
                        children: [
                          ImageHolder(
                            size: 90,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Column(
                            children: [
                              Text(
                                widget.name,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15,
                                ),
                              ),
                              Text(
                                widget.classe,
                                style: TextStyle(
                                  fontSize: 10,
                                  color: grey,
                                ),
                              ),
                              Text(
                                widget.schoolName,
                                style: TextStyle(
                                  fontSize: 10,
                                  color: grey,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 40,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            height: 130,
                            width: 130,
                            decoration: BoxDecoration(
                              border: Border.all(color: dark, width: 1),
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          Container(
                            height: 130,
                            width: 130,
                            decoration: BoxDecoration(
                              border: Border.all(color: dark, width: 1),
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            height: 130,
                            width: 130,
                            decoration: BoxDecoration(
                              border: Border.all(color: dark, width: 1),
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          Container(
                            height: 130,
                            width: 130,
                            decoration: BoxDecoration(
                              border: Border.all(color: dark, width: 1),
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                        ],
                      ),
                      Divider(
                        color: dark,
                      )
                    ],
                  ),
                )
              : Container()
        ],
      ),
    );
  }
}
