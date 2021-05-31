import 'dart:io';
import 'package:parse_server_sdk/parse_server_sdk.dart';
import 'package:ziivah/models/exercise.models.dart';

class Quizz {
  final String titre;
  final File image;
  final Exercise exercise;
  final String objectId;
  final DateTime createdAt;
  final DateTime updateAt;

  Quizz({
    this.objectId,
    this.createdAt,
    this.updateAt,
    this.titre,
    this.image,
    this.exercise,
  });

  Quizz.fromParse(ParseObject object)
      : titre = object.get('titre'),
        image = object.get('image'),
        exercise = object.get('exercise') != null
            ? Exercise.fromParse(object.get('exercise'))
            : null,
        objectId = object.objectId,
        createdAt = object.createdAt,
        updateAt = object.updatedAt;
}
