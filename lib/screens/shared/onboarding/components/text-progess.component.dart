import 'package:flutter/material.dart';

class TextProgressComponent extends StatelessWidget {
  final Color color;
  final String text;
  final double size;
  final bool showProgress;

  const TextProgressComponent(
      {Key key, this.color, this.text, this.size, this.showProgress})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        showProgress
            ? SizedBox(
                height: (size ?? 18),
                width: (size ?? 18),
                child: CircularProgressIndicator(
                  strokeWidth: 2,
                  backgroundColor: Colors.transparent,
                  valueColor:
                      AlwaysStoppedAnimation<Color>(color ?? Colors.white),
                ),
              )
            : Container(),
        SizedBox(width: 10),
        Text(
          "COMMENCER",
          style: TextStyle(
            color: color ?? Colors.white,
            fontWeight: FontWeight.w500,
            fontSize: size ?? 18,
          ),
        )
      ],
    );
  }
}
