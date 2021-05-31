import 'package:parse_server_sdk/parse_server_sdk.dart';
import 'package:ziivah/models/exercise.models.dart';
import 'package:ziivah/models/quizz.models.dart';

class Result {
  final String numero;
  final String pointTotal;
  final String eleve;
  final String date;
  final Exercise exercise;
  final String objectId;
  final DateTime createdAt;
  final DateTime updateAt;

  Result(
      {this.objectId,
      this.createdAt,
      this.updateAt,
      this.numero,
      this.pointTotal,
      this.eleve,
      this.date,
      this.exercise});

  Result.fromParse(ParseObject object)
      : numero = object.get('numero'),
        pointTotal = object.get('pointTotal'),
        eleve = object.get('eleve'),
        date = object.get('date'),
        exercise = object.get('exercise') != null
            ? Exercise.fromParse(object.get('exercise'))
            : null,
        objectId = object.objectId,
        createdAt = object.createdAt,
        updateAt = object.updatedAt;
}
