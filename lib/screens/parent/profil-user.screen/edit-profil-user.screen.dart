import 'package:flutter/material.dart';
import 'package:ziivah/components/background.component.dart';
import 'package:ziivah/components/custom-textfield.component.dart';
import 'package:ziivah/dialog/info.dialog.dart';
import 'package:ziivah/models/parent.model.dart';
import 'package:ziivah/screens/parent/home-screen/home.screen.dart';
import 'package:ziivah/services/parent.service.dart';
import 'package:ziivah/theme/color.theme.dart';

class EditProfilScreen extends StatefulWidget {
  @override
  _EditProfilScreenState createState() => _EditProfilScreenState();
}

class _EditProfilScreenState extends State<EditProfilScreen> {
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
              height: MediaQuery.of(context).size.height - 170,
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
                      padding: const EdgeInsets.symmetric(horizontal: 50),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Sexe',
                            style: TextStyle(fontSize: 12, color: white),
                          ),
                          Row(
                            children: [
                              Text(
                                'Masculin',
                                style: TextStyle(fontSize: 12, color: white),
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
                                style: TextStyle(fontSize: 12, color: white),
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
                    Container(
                        width: MediaQuery.of(context).size.width - 130,
                        height: 70,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(abonnementChoice),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                PopupMenuButton<String>(
                                  onSelected: actionChoice,
                                  itemBuilder: (BuildContext context) {
                                    return AbnType.abnType.map((String choice) {
                                      return PopupMenuItem<String>(
                                        value: choice,
                                        child: Text(choice),
                                      );
                                    }).toList();
                                  },
                                ),
                              ],
                            ),
                          ],
                        )),
                    SizedBox(
                      height: 20,
                    ),
                    RaisedButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8)),
                      color: Colors.blue[600],
                      onPressed: () async {
                        final response = await ParentService().registerNewUser(
                            email: email.text,
                            username: fullname.text,
                            password: password.text);
                        if (response) {
                          print(response);
                          Parent newParent = new Parent(
                            address: address.text,
                            childrenCount: 0,
                            email: email.text,
                            fullname: fullname.text,
                            image: null,
                            job: jobName.text,
                            phoneTel: phone.text,
                          );
                          final res = await ParentService().create(newParent);
                          if (res != null) {
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
                      child: Padding(
                        padding: const EdgeInsets.only(
                          bottom: 12.0,
                          top: 12.0,
                          left: 45,
                          right: 45,
                        ),
                        child: Text(
                          'Enregistrer',
                          style: TextStyle(
                            fontSize: 30,
                            color: white,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 40,
                    )
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
