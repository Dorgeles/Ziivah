import 'package:flutter/material.dart';
import 'package:line_icons/line_icon.dart';
import 'package:line_icons/line_icons.dart';
import 'package:ziivah/theme/color.theme.dart';

import 'image-hodler.component.dart';
import 'parent-menu.component.dart';

class ParentDrawer extends StatefulWidget {
  @override
  _ParentDrawerState createState() => _ParentDrawerState();
}

class _ParentDrawerState extends State<ParentDrawer> {
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Container(
      color: Colors.white54,
      width: screenSize.width / 1.15,
      child: Row(
        children: [
          Container(
            height: screenSize.height,
            width: 140,
            decoration: BoxDecoration(
              color: blue,
            ),
            child: Stack(
              children: [
                Positioned(
                  top: 200,
                  right: 10,
                  child: ImageHolder(
                    size: 120,
                  ),
                )
              ],
            ),
          ),
          Container(
            height: screenSize.height,
            width: screenSize.width / 1.15 - 140,
            decoration: BoxDecoration(
              color: white,
            ),
            child: Stack(
              children: [
                Positioned(
                  top: 220,
                  left: 0,
                  child: Column(
                    children: [
                      Text(
                        "Mr Dje Bi Gauley",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                      Text(
                        "Informaticien developpeur",
                        style: TextStyle(
                          fontSize: 10,
                          color: grey,
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        width: screenSize.width / 1.15 - 150,
                        height: 2,
                        color: grey,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      ParentMenu(
                        icon: LineIcons.clipboardList,
                        title: "Suivie",
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      ParentMenu(
                        icon: LineIcons.user,
                        title: "Enfant",
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        width: screenSize.width / 1.15 - 150,
                        height: 2,
                        color: grey,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      ParentMenu(
                        icon: LineIcons.userPlus,
                        title: "Ajouter enfant",
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      ParentMenu(
                        icon: Icons.help_outline,
                        title: "Aide",
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        width: screenSize.width / 1.15 - 150,
                        height: 2,
                        color: grey,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      ParentMenu(
                        icon: LineIcons.safari,
                        title: "Parametres",
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      ParentMenu(
                        icon: Icons.login_outlined,
                        title: "Suivie",
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
