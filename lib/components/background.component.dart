import 'package:flutter/material.dart';

class BackGround extends StatelessWidget {
  const BackGround({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/ZIIVAH ECRANDEMARAGE.jpg'),
              fit: BoxFit.cover)),
    );
  }
}
