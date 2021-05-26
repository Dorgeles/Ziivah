import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:ziivah/components/background.component.dart';
import 'package:ziivah/components/custom-textfield.component.dart';
import 'package:ziivah/models/grade.model.dart';
import 'package:ziivah/services/grade.service.dart';
import 'package:ziivah/theme/color.theme.dart';

class AddChildrenScreen extends StatefulWidget {
  @override
  _AddChildrenScreenState createState() => _AddChildrenScreenState();
}

class _AddChildrenScreenState extends State<AddChildrenScreen> {
  List<Grade> _grades;
  List<String> _gradesList;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
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

  String niveau = "Niveau scolaire";
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        BackGround(),
        SafeArea(
          child: Scaffold(
            backgroundColor: Colors.transparent,
            body: Center(
              child: Container(
                height: MediaQuery.of(context).size.height - 150,
                width: MediaQuery.of(context).size.width - 30,
                decoration: BoxDecoration(
                  color: Colors.white38,
                  borderRadius: BorderRadius.circular(13),
                ),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      SizedBox(
                        height: 50,
                      ),
                      CustomTextField(
                        isPassword: false,
                        label: "Noms prénoms",
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      CustomTextField(
                        isPassword: false,
                        type: TextInputType.emailAddress,
                        label: "Email",
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      CustomTextField(
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
                            Container(
                              height: 50,
                              width: 50,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(25),
                                color: Colors.green[200],
                              ),
                              child: Center(
                                child: Icon(LineIcons.female),
                              ),
                            ),
                            Container(
                              height: 50,
                              width: 50,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(25),
                                color: Colors.green[200],
                              ),
                              child: Center(
                                child: Icon(LineIcons.male),
                              ),
                            ),
                          ],
                        ),
                      ),
                      CustomTextField(
                        isPassword: false,
                        label: "Nom de l'école",
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width - 130,
                        height: 60,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: white,
                        ),
                        child: Row(
                          children: [
                            Center(
                                child: Text(
                              niveau,
                              style: TextStyle(
                                fontSize: 20,
                                color: grey,
                              ),
                            )),
                            _grades != null
                                ? Column(
                                    children: [
                                      PopupMenuButton<String>(
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
                        isPassword: false,
                        label: "Tel",
                        type: TextInputType.phone,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      // Container(
                      //     width: MediaQuery.of(context).size.width - 130,
                      //     height: 70,
                      //     child:
                      //      Row(
                      //       mainAxisAlignment:
                      //           MainAxisAlignment.spaceBetween,
                      //       children: [
                      //         // Text(abonnementChoice),
                      //         Column(
                      //           crossAxisAlignment: CrossAxisAlignment.end,
                      //           mainAxisAlignment: MainAxisAlignment.center,
                      //           children: [

                      //           ],
                      //         ),
                      //       ],
                      //     )),
                      SizedBox(
                        height: 20,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            bottomSheet: Container(
              width: MediaQuery.of(context).size.width,
              height: 70,
              child: Center(
                child: Text(
                  'Enregister',
                  style: TextStyle(
                    fontSize: 25,
                    color: dark,
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
