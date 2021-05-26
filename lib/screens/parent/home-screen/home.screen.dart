import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:parse_server_sdk/parse_server_sdk.dart';
import 'package:ziivah/components/background.component.dart';
import 'package:ziivah/components/image-hodler.component.dart';
import 'package:ziivah/components/parent-drawer.component.dart';
import 'package:ziivah/components/student-dropdown.component.dart';
import 'package:ziivah/models/parent.model.dart';
import 'package:ziivah/services/parent.service.dart';
import 'package:ziivah/theme/color.theme.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Parent _parent;
  bool loading = false;
  @override
  void initState() {
    // TODO: implement initState

    ParseUser.currentUser().then((user) {
      ParentService().getByUser(user).then((parent) {
        setState(() {
          _parent = parent;
          loading = true;
        });
      });
    });
    super.initState();
  }

  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Stack(
      children: [
        BackGround(),
        SafeArea(
          child: Scaffold(
            backgroundColor: Colors.transparent,
            key: _scaffoldKey,
            body: loading == false
                ? Container()
                : SingleChildScrollView(
                    child: Column(
                      children: [
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            SizedBox(
                              width: 10,
                            ),
                            ImageHolder(
                              size: 60,
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            Column(
                              children: [
                                Text(
                                  _parent.fullname,
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                  ),
                                ),
                                Text(
                                  _parent != null ? _parent.job : "",
                                  style: TextStyle(
                                    fontSize: 10,
                                    color: grey,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        StudentItem(
                          screenSize: screenSize,
                          classe: "Terminale S",
                          name: "Wifisan aslan Dje Bi",
                          schoolName: "Farandole",
                        ),
                        StudentItem(
                          screenSize: screenSize,
                          classe: "Première S",
                          name: "Camille Scart Dje Lou",
                          schoolName: "Farandole",
                        ),
                      ],
                    ),
                  ),
            drawer: ParentDrawer(),
          ),
        )
      ],
    );
  }
}
