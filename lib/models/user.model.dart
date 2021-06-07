import 'package:parse_server_sdk/parse_server_sdk.dart';

class User {
  final String username;
  final String email;
  final String profil;
  final String objectId;
  final DateTime createdAt;
  final DateTime updateAt;

  User({
    this.username,
    this.email,
    this.profil,
    this.objectId,
    this.createdAt,
    this.updateAt,
  });
  User.fromParse(ParseObject object)
      : email = object.get("email"),
        username = object.get("username"),
        profil = object.get('profil'),
        objectId = object.objectId,
        createdAt = object.createdAt,
        updateAt = object.updatedAt;
}
