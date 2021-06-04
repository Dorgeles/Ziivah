import 'package:parse_server_sdk/parse_server_sdk.dart';

import 'user.model.dart';

class Coach {
  final String firstname;
  final String lastname;
  final String email;
  final User user;
  final String commune;
  final String tel;
  final String objectId;
  final DateTime createdAt;
  final DateTime updateAt;

  Coach({
    this.objectId,
    this.createdAt,
    this.updateAt,
    this.firstname,
    this.lastname,
    this.email,
    this.user,
    this.commune,
    this.tel,
  });
  Coach.fromParse(ParseObject object)
      : firstname = object.get('firstname'),
        lastname = object.get('lastname'),
        tel = object.get('tel'),
        email = object.get('email'),
        commune = object.get('commune'),
        user = object.get('user') != null
            ? User.fromParse(object.get('user'))
            : null,
        objectId = object.objectId,
        createdAt = object.createdAt,
        updateAt = object.updatedAt;
}
