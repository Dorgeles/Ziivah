import 'package:flutter/material.dart';
import 'package:progress_dialog/progress_dialog.dart';
import 'package:ziivah/components/background.component.dart';
import 'package:ziivah/components/custom-textfield.component.dart';
import 'package:ziivah/dialog/info.dialog.dart';
import 'package:ziivah/dialog/progress.dialog.dart';
import 'package:ziivah/models/parent.model.dart';
import 'package:ziivah/screens/parent/home-screen/home.screen.dart';
import 'package:ziivah/services/parent.service.dart';
import 'package:ziivah/theme/color.theme.dart';

class EditParentProfilScreen extends StatefulWidget {
  @override
  _EditParentProfilScreenState createState() => _EditParentProfilScreenState();
}

class _EditParentProfilScreenState extends State<EditParentProfilScreen> {
  void actionChoice(String choice) {
    if (choice == "Type 1") {
      setState(() {
        abonnementChoice = "Type 1";
      });
    } else if (choice == "Type 2") {
      setState(() {
        abonnementChoice = "Type 2";
      });
    } else if (choice == "Type 3") {
      setState(() {
        abonnementChoice = "Type 3";
      });
    }
  }

  TextEditingController fullname = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController address = TextEditingController();
  TextEditingController jobName = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController phone = TextEditingController();
  bool isMale = false;
  bool isFemale = false;
  int step = 1;
  String abonnementChoice = "Type d'abonnement";

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        BackGround(),
        Scaffold(
          backgroundColor: Colors.transparent,
          body: Center(
            child: Container(
              height: MediaQuery.of(context).size.height - 220,
              width: MediaQuery.of(context).size.width - 30,
              decoration: BoxDecoration(
                color: Color(0xff2e5970),
                borderRadius: BorderRadius.circular(13),
              ),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    step == 1
                        ? Column(
                            children: [
                              SizedBox(
                                height: 50,
                              ),
                              CustomTextField(
                                isPassword: false,
                                controller: fullname,
                                label: "Noms prénoms",
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              CustomTextField(
                                isPassword: false,
                                controller: email,
                                type: TextInputType.emailAddress,
                                label: "Email",
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              CustomTextField(
                                isPassword: true,
                                controller: password,
                                label: "Mot de passe",
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 50),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Sexe',
                                      style:
                                          TextStyle(fontSize: 12, color: white),
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          'Masculin',
                                          style: TextStyle(
                                              fontSize: 12, color: white),
                                        ),
                                        Checkbox(
                                          value: isMale,
                                          onChanged: (value) {
                                            setState(() {
                                              this.isMale = value;
                                            });
                                          },
                                          checkColor: Colors.blue[600],
                                          activeColor: white,
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          'Féminin',
                                          style: TextStyle(
                                              fontSize: 12, color: white),
                                        ),
                                        Checkbox(
                                          value: isMale,
                                          onChanged: (value1) {
                                            print("ça passe ");
                                            setState(() {
                                              this.isFemale = value1;
                                            });
                                          },
                                          checkColor: Colors.blue[600],
                                          activeColor: white,
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              RaisedButton(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8)),
                                color: Colors.blue[600],
                                onPressed: () {
                                  setState(() {
                                    step = 2;
                                  });
                                },
                                child: Container(
                                  width: MediaQuery.of(context).size.width - 90,
                                  child: Center(
                                    child: Text(
                                      'Suivant',
                                      style: TextStyle(
                                        fontSize: 18,
                                        color: white,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          )
                        : Container(),
                    step == 2
                        ? Column(
                            children: [
                              SizedBox(
                                height: 50,
                              ),
                              CustomTextField(
                                controller: address,
                                isPassword: false,
                                label: "Situation géographique",
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              CustomTextField(
                                isPassword: false,
                                controller: jobName,
                                label: "Fonction",
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              CustomTextField(
                                controller: phone,
                                isPassword: false,
                                label: "Tel",
                                type: TextInputType.phone,
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              RaisedButton(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8)),
                                color: Colors.blue[600],
                                onPressed: () async {
                                  final ProgressDialog prog =
                                      showprogressDialog(context: context);
                                  prog.show();
                                  final response = await ParentService()
                                      .registerNewUser(
                                          email: email.text,
                                          username: fullname.text,
                                          password: password.text);
                                  if (response) {
                                    Parent newParent = new Parent(
                                      address: address.text,
                                      childrenCount: 0,
                                      email: email.text,
                                      fullname: fullname.text,
                                      image: null,
                                      job: jobName.text,
                                      phoneTel: phone.text,
                                      enable: false,
                                    );
                                    final res =
                                        await ParentService().create(newParent);
                                    if (res != null) {
                                      prog.hide();
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => HomeScreen(),
                                        ),
                                      );
                                    } else {
                                      showInfoDialog(context, "Oups",
                                          'Une erreur est subvenue veuillez contacter le service clientelle');
                                    }
                                  } else {
                                    showInfoDialog(context, "Oups",
                                        'Vous devez remplir tous les champs de saisi');
                                  }
                                },
                                child: Container(
                                  width: MediaQuery.of(context).size.width - 90,
                                  child: Center(
                                    child: Text(
                                      'Enregistrer',
                                      style: TextStyle(
                                        fontSize: 18,
                                        color: white,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 40,
                              )
                            ],
                          )
                        : Container()
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

class AbnType {
  static String type1 = "Type 1";
  static String type2 = "Type 2";
  static String type3 = "Type 3";

  static List<String> abnType = [type1, type2, type3];
}
