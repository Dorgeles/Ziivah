import 'package:flutter/material.dart';
import 'package:ziivah/theme/color.theme.dart';

class EditProfilSetting extends StatefulWidget {
  @override
  _EditProfilSettingState createState() => _EditProfilSettingState();
}

class _EditProfilSettingState extends State<EditProfilSetting> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Column(
            children: [
              SizedBox(
                height: 30,
              ),
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.close),
                ),
                IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.check_box,
                    color: Colors.green,
                    size: 40,
                  ),
                ),
              ]),
              Expanded(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 30,
                        ),
                        Text(
                          'Profil',
                          style: TextStyle(
                              color: dark,
                              fontSize: 50,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "photo",
                              style: TextStyle(color: grey, fontSize: 13),
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width / 4,
                            ),
                            Column(
                              children: [
                                Container(
                                  height: 110,
                                  width: 110,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(75),
                                      color: Colors.grey[200]),
                                ),
                                TextButton(
                                    onPressed: () {},
                                    child: Text(
                                      'choisir image',
                                      style: TextStyle(color: blue),
                                    ))
                              ],
                            ),
                            SizedBox(
                              width: 30,
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        Row(
                          children: [
                            Text(
                              'Noms & prénoms',
                              style: TextStyle(color: grey, fontSize: 13),
                            ),
                            Spacer(),
                            Container(
                              width: MediaQuery.of(context).size.width / 2 + 10,
                              child: TextField(
                                style: TextStyle(fontSize: 20),
                              ),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        Row(
                          children: [
                            Text(
                              'adresse',
                              style: TextStyle(color: grey, fontSize: 13),
                            ),
                            Spacer(),
                            Container(
                              width: MediaQuery.of(context).size.width / 2 + 10,
                              child: TextField(
                                style: TextStyle(fontSize: 20),
                              ),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        Row(
                          children: [
                            Text(
                              'Téléphone',
                              style: TextStyle(color: grey, fontSize: 13),
                            ),
                            Spacer(),
                            Container(
                              width: MediaQuery.of(context).size.width / 2 + 10,
                              child: TextField(
                                style: TextStyle(fontSize: 20),
                              ),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        Row(
                          children: [
                            Text(
                              'Profession',
                              style: TextStyle(color: grey, fontSize: 13),
                            ),
                            Spacer(),
                            Container(
                              width: MediaQuery.of(context).size.width / 2 + 10,
                              child: TextField(
                                style: TextStyle(fontSize: 20),
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
          Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width / 3,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: [Colors.black12, Colors.transparent],
              ),
            ),
          )
        ],
      ),
    );
  }
}
