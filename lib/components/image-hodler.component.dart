import 'package:flutter/material.dart';
import 'package:ziivah/theme/color.theme.dart';

class ImageHolder extends StatelessWidget {
  final double size;
  final Widget child;
  const ImageHolder({
    Key key,
    this.size,
    this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size,
      width: size,
      decoration: BoxDecoration(
        color: primary,
        borderRadius: BorderRadius.circular(size / 2),
        border: Border.all(width: 4, color: white),
      ),
      child: Center(
        child: child,
      ),
    );
  }
}
