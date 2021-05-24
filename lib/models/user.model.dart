import 'package:parse_server_sdk/parse_server_sdk.dart';

class User {
  final String username;
  final String email;
  final String objectId;
  final DateTime createdAt;
  final DateTime updateAt;

  User({
    this.username,
    this.email,
    this.objectId,
    this.createdAt,
    this.updateAt,
  });
  User.fromParse(ParseObject object)
      : email = object.get("email"),
        username = object.get("username"),
        objectId = object.objectId,
        createdAt = object.createdAt,
        updateAt = object.updatedAt;
}
