import 'package:parse_server_sdk/parse_server_sdk.dart';
import 'package:ziivah/models/choice.models.dart';
import 'package:ziivah/models/coach.model.dart';
import 'package:ziivah/models/exercise.models.dart';

class ChoiceService {
  //singleton
  static final ChoiceService _service = ChoiceService._internal();
  static final String _instanceRef = "Choice";

  factory ChoiceService() {
    return _service;
  }

  ChoiceService._internal();
  //fin singleton

  Future<Choice> create(Choice args, [String quizzId]) async {
    ParseObject pChoice = ParseObject(_instanceRef);
    ParseObject pQuizz = ParseObject("Quizz");
    /* ParseUser user = await ParseUser.currentUser();
    final ParseObject pUser = ParseObject("_User");
    pUser.objectId = user.objectId; */

    if (quizzId != null) {
      pQuizz.objectId = quizzId;
    }

    pChoice = ParseObject(_instanceRef)
      ..set("titre", args.titre)
      ..set("status", args.status)
      ..set("points", args.points)
      ..set("quizz", pQuizz);

    if (quizzId != null) {
      pQuizz.set("quizz", pQuizz);
    }

    final response = await pChoice.save();
    if (response.results != null)
      return Choice.fromParse(response.results.first);

    return null;
  }

  Future<Choice> getChoice(Coach coach) async {
    final pChoice = ParseObject(_instanceRef);
    QueryBuilder<ParseObject> queryBuilder = QueryBuilder<ParseObject>(pChoice);

    queryBuilder.setLimit(1);

    ParseObject pCoach = ParseObject("Coach");

    if (coach.objectId != null) pCoach.objectId = coach.objectId;

    queryBuilder.whereEqualTo("coach", pCoach);

    final response = await queryBuilder.query();

    if (response.results != null)
      return Choice.fromParse(response.results?.first);

    return null;
  }

  Future<Choice> readOne(String objectId) async {
    final pChoice = ParseObject(_instanceRef);
    final response = await pChoice.getObject(objectId);
    if (response.success) return Choice.fromParse(response.results.first);
    return null;
  }

  Future<Choice> update(Choice args) async {
    if (args.objectId != null) {
      ParseObject pChoice = ParseObject(_instanceRef);
      pChoice.objectId = args.objectId;
      pChoice
        ..set("titre", args.titre)
        ..set("status", args.status)
        ..set("points", args.points);

      final response = await pChoice.save();

      if (response.success) return Choice.fromParse(response.results.first);
      return null;
    } else {
      return null;
    }
  }

  filter([String titre]) async {
    final pChoice = ParseObject(_instanceRef);
    final QueryBuilder<ParseObject> query = QueryBuilder<ParseObject>(pChoice);
    query.setLimit(50);
    query.orderByDescending("updatedAt");
    query.includeObject(["coach"]);

    if (titre != null) {
      query.whereContains('titre', titre);
    }

    final response = await query.query();
    dynamic results;

    if (response.results != null)
      results = response.results.map((v) => Choice.fromParse(v)).toList();

    return results;
  }

  Future<Choice> delete(objectId) async {
    final pChoice = ParseObject(_instanceRef);
    pChoice.objectId = objectId;
    final response = await pChoice.delete();

    if (response.success) return Choice.fromParse(response.results.first);
    return null;
  }
}
