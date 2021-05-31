import 'package:parse_server_sdk/parse_server_sdk.dart';
import 'package:ziivah/models/coach.model.dart';
import 'package:ziivah/models/quizz.models.dart';

class QuizzService {
  //singleton
  static final QuizzService _service = QuizzService._internal();
  static final String _instanceRef = "Quizz";

  factory QuizzService() {
    return _service;
  }

  QuizzService._internal();
  //fin singleton

  Future<Quizz> create(Quizz args, [String exerciseId]) async {
    ParseObject pQuizz = ParseObject(_instanceRef);
    ParseObject pExercise = ParseObject("Exercise");
    /* ParseUser user = await ParseUser.currentUser();
    final ParseObject pUser = ParseObject("_User");
    pUser.objectId = user.objectId; */

    if (exerciseId != null) {
      pExercise.objectId = exerciseId;
    }

    pQuizz = ParseObject(_instanceRef)
      ..set("titre", args.titre)
      ..set("image", args.image)
      ..set("exercise", pExercise);

    if (exerciseId != null) {
      pExercise.set("exercise", pExercise);
    }

    final response = await pQuizz.save();
    if (response.results != null)
      return Quizz.fromParse(response.results.first);

    return null;
  }

  Future<Quizz> getQuizz(Coach coach) async {
    final pQuizz = ParseObject(_instanceRef);
    QueryBuilder<ParseObject> queryBuilder = QueryBuilder<ParseObject>(pQuizz);

    queryBuilder.setLimit(1);

    ParseObject pCoach = ParseObject("Coach");

    if (coach.objectId != null) pCoach.objectId = coach.objectId;

    queryBuilder.whereEqualTo("coach", pCoach);

    final response = await queryBuilder.query();

    if (response.results != null)
      return Quizz.fromParse(response.results?.first);

    return null;
  }

  Future<Quizz> update(Quizz args) async {
    if (args.objectId != null) {
      ParseObject pQuizz = ParseObject(_instanceRef);
      pQuizz.objectId = args.objectId;
      pQuizz..set("titre", args.titre)..set("image", args.image);

      final response = await pQuizz.save();

      if (response.success) return Quizz.fromParse(response.results.first);
      return null;
    } else {
      return null;
    }
  }

  filter([String titre]) async {
    final pQuizz = ParseObject(_instanceRef);
    final QueryBuilder<ParseObject> query = QueryBuilder<ParseObject>(pQuizz);
    query.setLimit(50);
    query.orderByDescending("updatedAt");
    query.includeObject(["coach"]);

    if (titre != null) {
      query.whereContains('titre', titre);
    }

    final response = await query.query();
    dynamic results;

    if (response.results != null)
      results = response.results.map((v) => Quizz.fromParse(v)).toList();

    return results;
  }

  Future<Quizz> delete(objectId) async {
    final pQuizz = ParseObject(_instanceRef);
    pQuizz.objectId = objectId;
    final response = await pQuizz.delete();

    if (response.success) return Quizz.fromParse(response.results.first);
    return null;
  }
}
