import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'screens/shared/loading-screen.dart';
import 'screens/shared/login-screens/login.screen.dart';
import 'screens/student/home-screen/home.screen.dart';
import 'services/init.service.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setEnabledSystemUIOverlays([]);
  final InitService init = InitService();
  await init.initParse();
  runApp(
    MyApp(),
  );
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ziivah',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: LoginScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
