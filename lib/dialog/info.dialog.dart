import 'package:flutter/material.dart';
import 'package:ziivah/theme/color.theme.dart';

Future showInfoDialog(BuildContext context, String title, String content) {
  return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            title,
            style: TextStyle(fontSize: 18, color: blue),
          ),
          content: Text(
            content,
            style: TextStyle(fontSize: 14, color: dark),
          ),
          actions: [
            FlatButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text(
                  'OK',
                  style: TextStyle(fontSize: 18, color: blue),
                ))
          ],
        );
      });
}
