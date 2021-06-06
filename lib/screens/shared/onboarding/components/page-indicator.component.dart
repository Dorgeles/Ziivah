import 'package:flutter/material.dart';
import 'package:ziivah/theme/color.theme.dart';

class PageIndicationComponent extends StatelessWidget {
  final bool isCurrentPage;

  PageIndicationComponent({this.isCurrentPage});

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 300),
      margin: EdgeInsets.symmetric(
        horizontal: 4.0,
      ),
      height: 7.0,
      width: isCurrentPage ? 22.0 : 7.0,
      decoration: BoxDecoration(
          color: isCurrentPage ? primary : primary.withOpacity(0.5),
          borderRadius: BorderRadius.circular(12)),
    );
  }
}
