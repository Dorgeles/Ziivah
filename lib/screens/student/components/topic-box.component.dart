import 'package:flutter/material.dart';
import 'package:ziivah/theme/color.theme.dart';

class TopicBox extends StatelessWidget {
  final String titre;
  final String image;
  final dynamic color;
  const TopicBox({
    Key key,
    @required this.screenSize,
    this.titre,
    this.image,
    this.color,
  }) : super(key: key);

  final Size screenSize;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: GestureDetector(
        behavior: HitTestBehavior.translucent,
        child: Container(
          width: screenSize.width - 40,
          height: 70,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: white,
            border: Border.all(
              color: dark,
              width: 1,
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                child: Padding(
                  padding: const EdgeInsets.only(
                      top: 20, left: 15, bottom: 10, right: 2),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: screenSize.width - 120,
                        child: Text(
                          titre,
                          style: TextStyle(
                              fontSize: 26, fontWeight: FontWeight.bold),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      Container(
                        height: 7,
                        width: screenSize.width - 120,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(3),
                          color: color,
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: Container(
                  width: 50,
                  height: 60,
                  color: grey,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
