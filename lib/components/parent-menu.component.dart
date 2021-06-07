import 'package:flutter/material.dart';
import 'package:ziivah/theme/color.theme.dart';

class ParentMenu extends StatelessWidget {
  final dynamic icon;
  final String title;
  final Function action;
  const ParentMenu({
    Key key,
    this.icon,
    this.title,
    this.action,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      child: Container(
        width: screenSize.width / 1.0 - 150,
        child: Row(
          children: [
            SizedBox(
              width: 20,
            ),
            Icon(
              icon,
              color: dark,
            ),
            SizedBox(
              width: 20,
            ),
            Text(
              title,
              style: TextStyle(fontSize: 15),
            ),
          ],
        ),
      ),
      onTap: action,
    );
  }
}
