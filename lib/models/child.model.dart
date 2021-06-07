import 'package:parse_server_sdk/parse_server_sdk.dart';
import 'package:ziivah/models/coach.model.dart';
import 'package:ziivah/models/parent.model.dart';
import 'user.model.dart';

class Child {
  final String fullname;
  final String grade;
  final User user;
  final String schoolName;
  final String phoneTel;
  final String username;
  final Parent parent;
  final List<Coach> coach;
  final String objectId;
  final DateTime createdAt;
  final DateTime updateAt;

  Child({
    this.objectId,
    this.createdAt,
    this.updateAt,
    this.fullname,
    this.username,
    this.grade,
    this.user,
    this.schoolName,
    this.phoneTel,
    this.parent,
    this.coach,
  });
  Child.fromParse(ParseObject object)
      : fullname = object.get('fullname'),
        grade = object.get('niveau'),
        schoolName = object.get('schoolName'),
        phoneTel = object.get('phoneTel'),
        username = object.get('username'),
        user = object.get('user') != null
            ? User.fromParse(object.get('user'))
            : null,
        parent = object.get('parent') != null
            ? Parent.fromParse(object.get('parent'))
            : null,
        coach = object.get('coach') != null
            ? List<Coach>.from((object.get("coach")))
            : null,
        objectId = object.objectId,
        createdAt = object.createdAt,
        updateAt = object.updatedAt;
}
