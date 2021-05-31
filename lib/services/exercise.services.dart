import 'package:parse_server_sdk/parse_server_sdk.dart';
import 'package:ziivah/models/coach.model.dart';
import 'package:ziivah/models/exercise.models.dart';

class ExerciseService {
  //singleton
  static final ExerciseService _service = ExerciseService._internal();
  static final String _instanceRef = "Exercise";

  factory ExerciseService() {
    return _service;
  }

  ExerciseService._internal();
  //fin singleton

  Future<Exercise> create(Exercise args,
      [String quizzId, String matiereId]) async {
    ParseObject pExercise = ParseObject(_instanceRef);
    ParseObject pQuizz = ParseObject("Quizz");
    ParseObject pMatiere = ParseObject("Subject");
    /* ParseUser user = await ParseUser.currentUser();
    final ParseObject pUser = ParseObject("_User");
    pUser.objectId = user.objectId; */

    if (quizzId != null) {
      pQuizz.objectId = quizzId;
    }
    if (matiereId != null) {
      pMatiere.objectId = matiereId;
    }

    pExercise = ParseObject(_instanceRef)
      ..set("niveau", args.niveau)
      ..set("chapitre", args.chapitre)
      ..set("quizz", pQuizz)
      ..set("matiere", pMatiere)
      ..set("titre", args.titre);

    if (quizzId != null) {
      pQuizz.set("quizz", pQuizz);
    }
    if (matiereId != null) {
      pMatiere.set("matiere", pMatiere);
    }

    final response = await pExercise.save();
    if (response.results != null)
      return Exercise.fromParse(response.results.first);

    return null;
  }

  Future<Exercise> getExercise(Coach coach) async {
    final pExercise = ParseObject(_instanceRef);
    QueryBuilder<ParseObject> queryBuilder =
        QueryBuilder<ParseObject>(pExercise);

    queryBuilder.setLimit(1);

    ParseObject pCoach = ParseObject("Coach");

    if (coach.objectId != null) pCoach.objectId = coach.objectId;

    queryBuilder.whereEqualTo("coach", pCoach);

    final response = await queryBuilder.query();

    if (response.results != null)
      return Exercise.fromParse(response.results?.first);

    return null;
  }

  Future<Exercise> readOne(String objectId) async {
    final pExercise = ParseObject(_instanceRef);
    final response = await pExercise.getObject(objectId);
    if (response.success) return Exercise.fromParse(response.results.first);
    return null;
  }

  Future<Exercise> update(Exercise args) async {
    if (args.objectId != null) {
      ParseObject pExercise = ParseObject(_instanceRef);
      pExercise.objectId = args.objectId;
      pExercise
        ..set("niveau", args.niveau)
        ..set("chapitre", args.chapitre)
        ..set("titre", args.titre);

      final response = await pExercise.save();

      if (response.success) return Exercise.fromParse(response.results.first);
      return null;
    } else {
      return null;
    }
  }

  filter([String niveau, String matiere]) async {
    final pExercise = ParseObject(_instanceRef);
    final QueryBuilder<ParseObject> query =
        QueryBuilder<ParseObject>(pExercise);
    query.setLimit(50);
    query.orderByDescending("updatedAt");
    query.includeObject(["coach"]);

    if (niveau != null) {
      query.whereContains('niveau', niveau);
    }
    if (matiere != null) {
      query.whereContains('matiere', matiere);
    }
    final response = await query.query();
    dynamic results;

    if (response.results != null)
      results = response.results.map((v) => Exercise.fromParse(v)).toList();

    return results;
  }

  Future<Exercise> delete(objectId) async {
    final pExercise = ParseObject(_instanceRef);
    pExercise.objectId = objectId;
    final response = await pExercise.delete();

    if (response.success) return Exercise.fromParse(response.results.first);
    return null;
  }
}
