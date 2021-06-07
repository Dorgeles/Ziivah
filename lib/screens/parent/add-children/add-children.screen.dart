import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:parse_server_sdk/parse_server_sdk.dart';
import 'package:ziivah/components/background.component.dart';
import 'package:ziivah/components/custom-textfield.component.dart';
import 'package:ziivah/dialog/info.dialog.dart';
import 'package:ziivah/models/child.model.dart';
import 'package:ziivah/models/grade.model.dart';
import 'package:ziivah/models/parent.model.dart';
import 'package:ziivah/screens/parent/home-screen/home.screen.dart';
import 'package:ziivah/services/child.service.dart';
import 'package:ziivah/services/grade.service.dart';
import 'package:ziivah/services/parent.service.dart';
import 'package:ziivah/theme/color.theme.dart';

class AddChildrenScreen extends StatefulWidget {
  @override
  _AddChildrenScreenState createState() => _AddChildrenScreenState();
}

class _AddChildrenScreenState extends State<AddChildrenScreen> {
  List<Grade> _grades;
  List<String> _gradesList = [];
  Parent _parent;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    ParseUser.currentUser().then((user) {
      ParentService().getByUser(user).then((value) {
        setState(() {
          _parent = value;
        });
      });
    });
    GradeService().getAllGrade().then((grades) {
      setState(() {
        _grades = grades;
        print("grades list $_grades");
        for (var item in _grades) {
          _gradesList.add("${item.label}");
        }
        print("grades list $_gradesList");
      });
    });
  }

  void actionNiveau(String choice) {
    print("_gradesList");
    setState(() {
      niveau = choice;
    });
  }

  List<String> choice = [];
  String niveau = "Niveau scolaire";
  TextEditingController fullname = TextEditingController();
  TextEditingController emailCtrl = TextEditingController();
  TextEditingController passwordCtrl = TextEditingController();
  TextEditingController schoolName = TextEditingController();
  TextEditingController phoneCtrl = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        BackGround(),
        SafeArea(
          child: Scaffold(
            backgroundColor: Colors.transparent,
            appBar: AppBar(
              elevation: 0,
              backgroundColor: Colors.transparent,
              title: Text("Ajouter un enfant"),
              actions: [
                IconButton(
                    onPressed: () async {
                      Child newChild = new Child(
                        parent: _parent,
                        fullname: fullname.text,
                        grade: niveau,
                        username: emailCtrl.text,
                        phoneTel: phoneCtrl.text,
                        schoolName: schoolName.text,
                      );

                      if (choice.isEmpty) {
                        showInfoDialog(context, 'Info',
                            "Vous devez renseigner tous les champs");
                      } else {
                        final response = await ChildService()
                            .create(newChild, passwordCtrl.text);
                        if (response != null) {
                          print("on est ici au moins");
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => HomeScreen(),
                            ),
                          );
                        }
                      }
                    },
                    icon: Icon(
                      Icons.check,
                      size: 25,
                      color: Colors.green,
                    ))
              ],
            ),
            body: Center(
              child: Container(
                height: MediaQuery.of(context).size.height - 150,
                width: MediaQuery.of(context).size.width - 30,
                decoration: BoxDecoration(
                  color: darkBlue,
                  borderRadius: BorderRadius.circular(13),
                ),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      SizedBox(
                        height: 20,
                      ),
                      CustomTextField(
                        controller: fullname,
                        isPassword: false,
                        label: "Noms prénoms",
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      CustomTextField(
                        controller: emailCtrl,
                        isPassword: false,
                        type: TextInputType.emailAddress,
                        label: "Nom d'utilisateur",
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      CustomTextField(
                        controller: passwordCtrl,
                        isPassword: true,
                        label: "Mot de passe",
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 70,
                          vertical: 20,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            GestureDetector(
                              behavior: HitTestBehavior.translucent,
                              onTap: () {
                                setState(() {
                                  choice.clear();
                                  choice.add("female");
                                  print(choice[0]);
                                });
                              },
                              child: Container(
                                height: 50,
                                width: 50,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(25),
                                  color: choice.contains("female")
                                      ? blue
                                      : Colors.green[200],
                                ),
                                child: Center(
                                  child: Icon(
                                    LineIcons.female,
                                    color: choice.contains("female")
                                        ? white
                                        : dark,
                                  ),
                                ),
                              ),
                            ),
                            GestureDetector(
                              behavior: HitTestBehavior.translucent,
                              onTap: () {
                                setState(() {
                                  choice.clear();
                                  choice.add("male");
                                  print(choice[0]);
                                });
                              },
                              child: Container(
                                height: 50,
                                width: 50,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(25),
                                  color: choice.contains("male")
                                      ? blue
                                      : Colors.green[200],
                                ),
                                child: Center(
                                  child: Icon(
                                    LineIcons.male,
                                    color:
                                        choice.contains("male") ? white : dark,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      CustomTextField(
                        controller: schoolName,
                        isPassword: false,
                        label: "Nom de l'école",
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width - 63,
                        height: 60,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: white,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Center(
                                child: Text(
                              '   $niveau',
                              style: TextStyle(
                                fontSize: 20,
                                color: grey,
                              ),
                            )),
                            _grades != null
                                ? Column(
                                    children: [
                                      PopupMenuButton<String>(
                                        icon: Icon(Icons.school),
                                        onSelected: actionNiveau,
                                        itemBuilder: (BuildContext context) {
                                          return _gradesList
                                              .map((String grade) {
                                            return PopupMenuItem<String>(
                                              value: grade,
                                              child: Text(
                                                grade,
                                                style: TextStyle(
                                                  fontSize: 20,
                                                  color: grey,
                                                ),
                                              ),
                                            );
                                          }).toList();
                                        },
                                      ),
                                    ],
                                  )
                                : Container(),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      CustomTextField(
                        controller: phoneCtrl,
                        isPassword: false,
                        label: "Tel",
                        type: TextInputType.phone,
                      ),
                      SizedBox(
                        height: 30,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
