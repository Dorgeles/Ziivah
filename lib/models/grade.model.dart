import 'package:parse_server_sdk/parse_server_sdk.dart';

class Grade {
  final String label;
  final String objectId;
  final DateTime createdAt;
  final DateTime updateAt;

  Grade({
    this.label,
    this.objectId,
    this.createdAt,
    this.updateAt,
  });
  Grade.fromParse(ParseObject object)
      : label = object.get("label"),
        objectId = object.objectId,
        createdAt = object.createdAt,
        updateAt = object.updatedAt;
}
