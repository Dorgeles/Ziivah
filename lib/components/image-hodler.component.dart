import 'package:flutter/material.dart';
import 'package:ziivah/theme/color.theme.dart';

class ImageHolder extends StatelessWidget {
  final double size;
  const ImageHolder({
    Key key,
    this.size,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size,
      width: size,
      decoration: BoxDecoration(
        color: white,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(width: 4, color: dark),
      ),
      child: Center(
        child: Container(
          height: size * .875,
          width: size * .875,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(width: 1, color: dark),
              color: white),
        ),
      ),
    );
  }
}
