import 'package:flutter/material.dart';
import 'package:ziivah/components/background.component.dart';

class LoadingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        BackGround(),
        Scaffold(
          backgroundColor: Colors.transparent,
          body: Column(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height / 2.3,
              ),
              Center(
                child: Container(
                  height: 100,
                  width: 170,
                  color: Colors.white,
                  child: Center(child: Text('LOGO')),
                ),
              ),
              Spacer(),
              Text("Powered by @Afrik'Apps"),
            ],
          ),
        )
      ],
    );
  }
}
