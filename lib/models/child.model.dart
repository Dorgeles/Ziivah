import 'dart:html';

import 'package:parse_server_sdk/parse_server_sdk.dart';
import 'package:ziivah/models/coach.model.dart';
import 'package:ziivah/models/parent.model.dart';

import 'user.model.dart';

class Child {
  final String firstname;
  final String lastname;
  final String niveau;
  final User user;
  final String schoolName;
  final String phoneTel;
  final Parent parent;
  final Coach coach;
  final String objectId;
  final DateTime createdAt;
  final DateTime updateAt;

  Child({
    this.objectId,
    this.createdAt,
    this.updateAt,
    this.firstname,
    this.lastname,
    this.niveau,
    this.user,
    this.schoolName,
    this.phoneTel,
    this.parent,
    this.coach,
  });
  Child.fromParse(ParseObject object)
      : firstname = object.get('firstname'),
        lastname = object.get('lastname'),
        niveau = object.get('niveau'),
        schoolName = object.get('schoolName'),
        phoneTel = object.get('phoneTel'),
        user = object.get('user') != null
            ? User.fromParse(object.get('user'))
            : null,
        parent = object.get('parent') != null
            ? Parent.fromParse(object.get('parent'))
            : null,
        coach = object.get('coach') != null
            ? Coach.fromParse(object.get("coach"))
            : null,
        objectId = object.objectId,
        createdAt = object.createdAt,
        updateAt = object.updatedAt;
}
