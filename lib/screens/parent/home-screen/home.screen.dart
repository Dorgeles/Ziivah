import 'package:flutter/material.dart';
import 'package:parse_server_sdk/parse_server_sdk.dart';
import 'package:ziivah/components/background.component.dart';
import 'package:ziivah/components/image-hodler.component.dart';
import 'package:ziivah/components/parent-drawer.component.dart';
import 'package:ziivah/components/student-dropdown.component.dart';
import 'package:ziivah/models/child.model.dart';
import 'package:ziivah/models/parent.model.dart';
import 'package:ziivah/services/child.service.dart';
import 'package:ziivah/services/parent.service.dart';
import 'package:ziivah/theme/color.theme.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Parent _parent;
  List<Child> children = [];
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
        ChildService().getChildrenByParent(parent.objectId).then((value) {
          setState(() {
            children = value;
          });
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
            appBar: AppBar(
              elevation: 0,
              backgroundColor: Colors.transparent,
              leading: IconButton(
                onPressed: () {
                  if (_scaffoldKey.currentState.isDrawerOpen) {
                    _scaffoldKey.currentState.openEndDrawer();
                  } else {
                    _scaffoldKey.currentState.openDrawer();
                  }
                },
                icon: Icon(Icons.menu),
              ),
              title: Text('Mon acceuil'),
              actions: [
                CircleAvatar(
                  backgroundColor: blue,
                ),
                SizedBox(
                  width: 10,
                )
              ],
            ),
            key: _scaffoldKey,
            body: loading == false
                ? Container()
                : SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          SizedBox(
                            height: 10,
                          ),
                          ListView.builder(
                              shrinkWrap: true,
                              itemCount: children.length,
                              itemBuilder: (context, index) {
                                return StudentItem(
                                  screenSize: screenSize,
                                  child: children[index],
                                );
                              })
                          // StudentItem(

                          // ),
                          // StudentItem(

                          // ),
                        ],
                      ),
                    ),
                  ),
            drawer: ParentDrawer(),
          ),
        )
      ],
    );
  }
}
