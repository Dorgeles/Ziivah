import 'package:parse_server_sdk/parse_server_sdk.dart';

class Subject {
  final String titre;
  final String objectId;
  final DateTime createdAt;
  final DateTime updateAt;

  Subject({
    this.titre,
    this.objectId,
    this.createdAt,
    this.updateAt,
  });

  Subject.fromParse(ParseObject object)
      : titre = object.get('titre'),
        objectId = object.objectId,
        createdAt = object.createdAt,
        updateAt = object.updatedAt;
}
