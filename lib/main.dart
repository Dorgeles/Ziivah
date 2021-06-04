import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ziivah/screens/parent/home-screen/home.screen.dart';
import 'screens/shared/loading-screen.dart';
import 'screens/shared/login-screens/login.screen.dart';
import 'screens/student/home-screen/home.screen.dart';
import 'services/init.service.dart';

Map<int, Color> color = {
  50: Color.fromRGBO(136, 14, 79, .1),
  100: Color.fromRGBO(136, 14, 79, .2),
  200: Color.fromRGBO(136, 14, 79, .3),
  300: Color.fromRGBO(136, 14, 79, .4),
  400: Color.fromRGBO(136, 14, 79, .5),
  500: Color.fromRGBO(136, 14, 79, .6),
  600: Color.fromRGBO(136, 14, 79, .7),
  700: Color.fromRGBO(136, 14, 79, .8),
  800: Color.fromRGBO(136, 14, 79, .9),
  900: Color.fromRGBO(136, 14, 79, 1),
};
MaterialColor colorCustom = MaterialColor(0xfffbc030, color);
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
        primarySwatch: colorCustom,
      ),
      home: LoginScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
