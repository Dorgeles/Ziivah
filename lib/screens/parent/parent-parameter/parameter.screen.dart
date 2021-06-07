import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:parse_server_sdk/parse_server_sdk.dart';
import 'package:ziivah/components/background.component.dart';
import 'package:ziivah/components/image-hodler.component.dart';
import 'package:ziivah/models/child.model.dart';
import 'package:ziivah/models/parent.model.dart';
import 'package:ziivah/screens/parent/parent-parameter/edit-profil-setting.screen.dart';
import 'package:ziivah/services/child.service.dart';
import 'package:ziivah/services/parent.service.dart';
import 'package:ziivah/theme/color.theme.dart';

class ParameterScreen extends StatefulWidget {
  @override
  _ParameterScreenState createState() => _ParameterScreenState();
}

class _ParameterScreenState extends State<ParameterScreen> {
  Parent parent;
  List<Child> children = [];
  bool loading = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    ParseUser.currentUser().then((user) {
      ParentService().getByUser(user).then((value) {
        ChildService().getChildrenByParent(value.objectId).then((value) {
          setState(() {
            children = value;
          });
        });
        setState(() {
          parent = value;
          loading = true;
        });
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        BackGround(),
        SafeArea(
          child: Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
              elevation: 0,
              backgroundColor: Colors.transparent,
              leading: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(
                    Icons.arrow_back_ios,
                    color: grey,
                  )),
            ),
            body: loading == false
                ? Container()
                : SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 30,
                          ),
                          Text(
                            'Paramètres',
                            style: TextStyle(
                                color: dark,
                                fontSize: 50,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: 50,
                          ),
                          Text(
                            'Profil',
                            style: TextStyle(
                              color: dark,
                              fontSize: 18,
                            ),
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          GestureDetector(
                            behavior: HitTestBehavior.translucent,
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => EditProfilSetting(),
                                ),
                              );
                            },
                            child: Card(
                              elevation: 0,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  ImageHolder(
                                    size: 80,
                                  ),
                                  Column(children: [
                                    Text(
                                      parent.fullname,
                                      style: TextStyle(
                                        color: dark,
                                        fontSize: 18,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                      parent.job,
                                      style: TextStyle(
                                        color: grey,
                                        fontSize: 13,
                                      ),
                                    ),
                                  ]),
                                  Container(
                                    height: 50,
                                    width: 45,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        color: Colors.grey[200]),
                                    child: IconButton(
                                        onPressed: () {},
                                        icon: Icon(Icons.arrow_forward_ios)),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          Text(
                            "Options",
                            style: TextStyle(
                              color: dark,
                              fontSize: 18,
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          ListTile(
                            onTap: () {},
                            leading: Container(
                              height: 50,
                              width: 50,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(25),
                                color: Colors.orange[200],
                              ),
                              child: Center(
                                child: Icon(
                                  LineIcons.peopleCarry,
                                ),
                              ),
                            ),
                            title: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Enfants",
                                  style: TextStyle(
                                    color: dark,
                                    fontSize: 20,
                                  ),
                                ),
                                Text(
                                  children.length.toString(),
                                  style: TextStyle(color: grey, fontSize: 13),
                                ),
                              ],
                            ),
                            trailing: GestureDetector(
                              onTap: () {
                                print("lsdfsdflj lsdkjfl");
                              },
                              child: Container(
                                height: 50,
                                width: 45,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.grey[200],
                                ),
                                child: Center(
                                  child: Icon(Icons.arrow_forward_ios),
                                ),
                              ),
                            ),
                          ),
                          ListTile(
                            leading: Container(
                              height: 50,
                              width: 50,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(25),
                                color: Colors.blue[200],
                              ),
                              child: Center(
                                child: Icon(
                                  LineIcons.chalkboardTeacher,
                                ),
                              ),
                            ),
                            title: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Coachs",
                                  style: TextStyle(
                                    color: dark,
                                    fontSize: 20,
                                  ),
                                ),
                                Text(
                                  "5",
                                  style: TextStyle(color: grey, fontSize: 13),
                                ),
                              ],
                            ),
                            trailing: Container(
                              height: 50,
                              width: 45,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.grey[200],
                              ),
                              child: Center(
                                child: Icon(Icons.arrow_forward_ios),
                              ),
                            ),
                          ),
                          ListTile(
                            leading: Container(
                              height: 50,
                              width: 50,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(25),
                                color: Colors.green[200],
                              ),
                              child: Center(
                                child: Icon(
                                  LineIcons.moneyBill,
                                ),
                              ),
                            ),
                            title: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Abonnement",
                                  style: TextStyle(
                                    color: dark,
                                    fontSize: 20,
                                  ),
                                ),
                                Text(
                                  "1",
                                  style: TextStyle(color: grey, fontSize: 13),
                                ),
                              ],
                            ),
                            trailing: Container(
                              height: 50,
                              width: 45,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.grey[200],
                              ),
                              child: Center(
                                child: Icon(Icons.arrow_forward_ios),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
          ),
        )
      ],
    );
  }
}
