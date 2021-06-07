import 'package:flutter/material.dart';
import 'package:parse_server_sdk/parse_server_sdk.dart';
import 'package:progress_dialog/progress_dialog.dart';
import 'package:ziivah/components/background.component.dart';
import 'package:ziivah/components/custom-textfield.component.dart';
import 'package:ziivah/dialog/info.dialog.dart';
import 'package:ziivah/dialog/progress.dialog.dart';
import 'package:ziivah/screens/parent/edit-parent/edit-parent-profil.screen.dart';
import 'package:ziivah/screens/parent/home-screen/home.screen.dart';
import 'package:ziivah/theme/color.theme.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController username = TextEditingController();
  TextEditingController password = TextEditingController();
  bool value = false;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        BackGround(),
        Scaffold(
          backgroundColor: Colors.transparent,
          body: Center(
            child: Container(
              height: 500,
              width: MediaQuery.of(context).size.width - 30,
              child: Stack(
                children: [
                  Positioned(
                    bottom: 0,
                    child: Container(
                      height: 450,
                      width: MediaQuery.of(context).size.width - 30,
                      decoration: BoxDecoration(
                          color: Color(0xff2e5970),
                          borderRadius: BorderRadius.circular(13)),
                      child: Column(
                        children: [
                          SizedBox(
                            height: 60,
                          ),
                          Text(
                            'Login',
                            style: TextStyle(
                              fontSize: 28,
                              color: white,
                            ),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          CustomTextField(
                            isPassword: false,
                            controller: username,
                            type: TextInputType.emailAddress,
                            icon: Icons.person,
                            label: "Pseudo or Email",
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          CustomTextField(
                            isPassword: false,
                            controller: password,
                            type: TextInputType.text,
                            icon: Icons.lock,
                            label: "Mot de passe",
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
                              var user = ParseUser(
                                  username.text, password.text, username.text);
                              final response = await user.login();
                              if (response != null) {
                                prog.hide();
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => HomeScreen(),
                                  ),
                                );
                              }
                              showInfoDialog(
                                context,
                                "Oups",
                                "Vous n'avez pas de compte ",
                              );
                            },
                            child: Container(
                              width: MediaQuery.of(context).size.width - 90,
                              child: Center(
                                child: Text(
                                  'Connexion',
                                  style: TextStyle(
                                    fontSize: 18,
                                    color: white,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: Column(
                              children: [
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      width: 2,
                                    ),
                                    Text(
                                      'Pas de compte? ',
                                      style: TextStyle(
                                        fontSize: 14,
                                        color: white,
                                      ),
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                EditParentProfilScreen(),
                                          ),
                                        );
                                      },
                                      child: Text(
                                        "Cliquer ici",
                                        style: TextStyle(
                                          fontSize: 14,
                                          color: white,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                Row(
                                  children: [
                                    Checkbox(
                                      value: value,
                                      onChanged: (val) {
                                        print("ça passe ");
                                        setState(() {
                                          value = val;
                                        });
                                      },
                                      checkColor: Colors.blue[600],
                                      activeColor: white,
                                    ),
                                    Text(
                                      'Remember me',
                                      style: TextStyle(
                                        fontSize: 12,
                                        color: white,
                                      ),
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        // Navigator.push(
                                        //   context,
                                        //   MaterialPageRoute(
                                        //     builder: (context) =>
                                        //         EditProfilScreen(),
                                        //   ),
                                        // );
                                      },
                                      child: Text(
                                        "Mot de passe oublié?",
                                        style: TextStyle(
                                          fontSize: 12,
                                          color: white,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    top: 0,
                    right: (MediaQuery.of(context).size.width / 2) - (70),
                    left: (MediaQuery.of(context).size.width / 2) - (60),
                    child: Align(
                      child: Stack(
                        children: [
                          Container(
                            height: 100,
                            width: 100,
                            decoration: BoxDecoration(
                              color: Colors.blue[600],
                              borderRadius: BorderRadius.circular(50),
                            ),
                          ),
                          Center(
                            child: Icon(
                              Icons.person_outline,
                              color: Colors.white,
                              size: 90,
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        )
      ],
    );
  }
}
