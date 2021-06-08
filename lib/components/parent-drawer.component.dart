import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:parse_server_sdk/parse_server_sdk.dart';
import 'package:ziivah/models/child.model.dart';
import 'package:ziivah/models/parent.model.dart';
import 'package:ziivah/screens/parent/add-children/add-children.screen.dart';
import 'package:ziivah/screens/parent/home-screen/home.screen.dart';
import 'package:ziivah/screens/parent/parent-parameter/parameter.screen.dart';
import 'package:ziivah/screens/shared/library/library.screen.dart';
import 'package:ziivah/services/child.service.dart';
import 'package:ziivah/services/parent.service.dart';
import 'package:ziivah/theme/color.theme.dart';

import 'image-hodler.component.dart';
import 'parent-menu.component.dart';

class ParentDrawer extends StatefulWidget {
  @override
  _ParentDrawerState createState() => _ParentDrawerState();
}

class _ParentDrawerState extends State<ParentDrawer> {
  Parent _parent;
  bool loading = false;
  List<Child> children = [];
  @override
  void initState() {
    // TODO: implement initState

    ParseUser.currentUser().then((user) {
      ParentService().getByUser(user).then((parent) {
        ChildService().getChildrenByParent(parent.objectId).then((value) {
          setState(() {
            children = value;
          });
        });
        setState(() {
          _parent = parent;
          loading = true;
        });
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Container(
      color: Colors.white54,
      width: (screenSize.width / 1.15 - 100) + 101,
      child: Row(
        children: [
          Container(
            height: screenSize.height,
            width: 100,
            decoration: BoxDecoration(
              color: blue,
            ),
            child: Stack(
              children: [
                Positioned(
                  top: 130,
                  right: 10,
                  child: ImageHolder(
                    size: 80,
                  ),
                )
              ],
            ),
          ),
          Container(
            height: screenSize.height,
            width: screenSize.width / 1.15 - 100,
            decoration: BoxDecoration(
              color: white,
            ),
            child: Stack(
              children: [
                Positioned(
                  top: 150,
                  left: 0,
                  child: Column(
                    children: [
                      Container(
                        width: screenSize.width / 1.15 - 150,
                        child: Text(
                          _parent != null ? _parent.fullname : "...",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 24,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: Container(
                          width: screenSize.width / 1.15 - 150,
                          child: Text(
                            children.isNotEmpty
                                ? "${children.length} enfant"
                                : "...",
                            style: TextStyle(
                              fontSize: 13,
                              color: grey,
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Column(
                        children: [
                          ParentMenu(
                            icon: LineIcons.user,
                            title: "Enfants",
                            action: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => HomeScreen(),
                                ),
                              );
                            },
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          ParentMenu(
                            icon: LineIcons.userPlus,
                            title: "Ajouter un enfant",
                            action: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => AddChildrenScreen(),
                                ),
                              );
                            },
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          ParentMenu(
                            icon: LineIcons.clipboardList,
                            title: "Suivie",
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          ParentMenu(
                            icon: LineIcons.bookOpen,
                            title: "Librairie",
                            action: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => LibraryScreen(),
                                ),
                              );
                            },
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          ParentMenu(
                            icon: Icons.help_outline,
                            title: "Aide",
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          ParentMenu(
                            icon: LineIcons.safari,
                            title: "Parametres",
                            action: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => ParameterScreen(),
                                ),
                              );
                            },
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          ParentMenu(
                            icon: Icons.login_outlined,
                            title: "Déconnexion",
                          ),
                        ],
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
