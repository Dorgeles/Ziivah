import 'package:parse_server_sdk/parse_server_sdk.dart';
import 'package:ziivah/models/coach.model.dart';
import 'package:ziivah/models/quizz.models.dart';
import 'package:ziivah/models/result.models.dart';

class ResultService {
  //singleton
  static final ResultService _service = ResultService._internal();
  static final String _instanceRef = "Result";

  factory ResultService() {
    return _service;
  }

  ResultService._internal();
  //fin singleton

  Future<Result> create(Result args, [String exerciseId]) async {
    ParseObject pResult = ParseObject(_instanceRef);
    ParseObject pExercise = ParseObject("Exercise");
    /* ParseUser user = await ParseUser.currentUser();
    final ParseObject pUser = ParseObject("_User");
    pUser.objectId = user.objectId; */

    if (exerciseId != null) {
      pExercise.objectId = exerciseId;
    }

    pResult = ParseObject(_instanceRef)
      ..set("numero", args.numero)
      ..set("pointTotal", args.pointTotal)
      ..set("date", args.date)
      ..set("eleve", args.eleve)
      ..set("exercise", pExercise);

    if (exerciseId != null) {
      pExercise.set("exercise", pExercise);
    }

    final response = await pResult.save();
    if (response.results != null)
      return Result.fromParse(response.results.first);

    return null;
  }

  Future<Result> getResult(Coach coach) async {
    final pResult = ParseObject(_instanceRef);
    QueryBuilder<ParseObject> queryBuilder = QueryBuilder<ParseObject>(pResult);

    queryBuilder.setLimit(1);

    ParseObject pCoach = ParseObject("Coach");

    if (coach.objectId != null) pCoach.objectId = coach.objectId;

    queryBuilder.whereEqualTo("coach", pCoach);

    final response = await queryBuilder.query();

    if (response.results != null)
      return Result.fromParse(response.results?.first);

    return null;
  }

  Future<Result> update(Result args) async {
    if (args.objectId != null) {
      ParseObject pResult = ParseObject(_instanceRef);
      pResult.objectId = args.objectId;
      pResult
        ..set("numero", args.numero)
        ..set("pointTotal", args.pointTotal)
        ..set("eleve", args.eleve)
        ..set("date", args.date);

      final response = await pResult.save();

      if (response.success) return Result.fromParse(response.results.first);
      return null;
    } else {
      return null;
    }
  }

  filter([String eleve]) async {
    final pResult = ParseObject(_instanceRef);
    final QueryBuilder<ParseObject> query = QueryBuilder<ParseObject>(pResult);
    query.setLimit(50);
    query.orderByDescending("updatedAt");
    query.includeObject(["coach"]);

    if (eleve != null) {
      query.whereContains('eleve', eleve);
    }

    final response = await query.query();
    dynamic results;

    if (response.results != null)
      results = response.results.map((v) => Result.fromParse(v)).toList();

    return results;
  }

  Future<Result> delete(objectId) async {
    final pResult = ParseObject(_instanceRef);
    pResult.objectId = objectId;
    final response = await pResult.delete();

    if (response.success) return Result.fromParse(response.results.first);
    return null;
  }
}
