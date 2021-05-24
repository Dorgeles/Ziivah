import 'package:flutter/material.dart';
import 'package:parse_server_sdk/parse_server_sdk.dart';
import 'package:ziivah/components/background.component.dart';
import 'package:ziivah/components/custom-textfield.component.dart';
import 'package:ziivah/dialog/info.dialog.dart';
import 'package:ziivah/models/parent.model.dart';
import 'package:ziivah/screens/parent/home-screen/home.screen.dart';
import 'package:ziivah/screens/parent/profil-user.screen/edit-profil-user.screen.dart';
import 'package:ziivah/services/parent.service.dart';
import 'package:ziivah/theme/color.theme.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController username = TextEditingController();
  TextEditingController password = TextEditingController();
  // TextEditingController username = TextEditingController();
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
              height: 450,
              width: MediaQuery.of(context).size.width - 30,
              child: Stack(
                children: [
                  Positioned(
                    bottom: 0,
                    child: Container(
                      height: 400,
                      width: MediaQuery.of(context).size.width - 30,
                      decoration: BoxDecoration(
                          color: Colors.white54,
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
                              color: grey,
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
                              final response = await ParseUser(username.text,
                                      password.text, username.text)
                                  .login();
                              if (response.success) {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => HomeScreen(),
                                  ),
                                );
                              } else {
                                showInfoDialog(
                                  context,
                                  "Oups",
                                  "Vous n'avez pas de compte ",
                                );
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
                                'Connexion',
                                style: TextStyle(
                                  fontSize: 30,
                                  color: white,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 35),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Checkbox(
                                      value: value,
                                      onChanged: (value) {
                                        setState(() {
                                          this.value = value;
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
                                  ],
                                ),
                                TextButton(
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            EditProfilScreen(),
                                      ),
                                    );
                                  },
                                  child: Text(
                                    "Mot de passe oublié?",
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: white,
                                    ),
                                  ),
                                )
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
