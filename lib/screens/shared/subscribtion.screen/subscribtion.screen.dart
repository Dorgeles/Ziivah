import 'package:flutter/material.dart';
import 'package:ziivah/components/background.component.dart';

class SubscriptionScreen extends StatefulWidget {
  const SubscriptionScreen({Key key}) : super(key: key);

  @override
  _SubscriptionScreenState createState() => _SubscriptionScreenState();
}

class _SubscriptionScreenState extends State<SubscriptionScreen> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        BackGround(),
        SafeArea(child: Scaffold()),
      ],
    );
  }
}
