import 'package:parse_server_sdk/parse_server_sdk.dart';
import 'package:ziivah/models/quizz.models.dart';

class Choice {
  final String titre;
  final String status;
  final String points;
  final Quizz quizz;
  final String objectId;
  final DateTime createdAt;
  final DateTime updateAt;

  Choice(
      {this.objectId,
      this.createdAt,
      this.updateAt,
      this.titre,
      this.status,
      this.points,
      this.quizz});

  Choice.fromParse(ParseObject object)
      : titre = object.get('titre'),
        status = object.get('status'),
        points = object.get('points'),
        quizz = object.get('quizz') != null
            ? Quizz.fromParse(object.get('quizz'))
            : null,
        objectId = object.objectId,
        createdAt = object.createdAt,
        updateAt = object.updatedAt;
}
