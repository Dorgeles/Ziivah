import 'package:parse_server_sdk/parse_server_sdk.dart';
import 'package:ziivah/models/grade.model.dart';

class GradeService {
  //singleton
  static final GradeService _service = GradeService._internal();
  static final String _instanceRef = "Grade";

  factory GradeService() {
    return _service;
  }

  GradeService._internal();

  Future<List<Grade>> getAllGrade() async {
    ParseObject pGrade = ParseObject(_instanceRef);
    QueryBuilder<ParseObject> query = QueryBuilder<ParseObject>(pGrade);
    final response = await query.query();
    List<Grade> results = [];
    if (response != null) {
      results = response.results.map((e) => Grade.fromParse(e)).toList();
    }
    return results;
  }
}
