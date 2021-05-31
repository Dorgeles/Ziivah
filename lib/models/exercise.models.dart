import 'package:parse_server_sdk/parse_server_sdk.dart';
import 'package:ziivah/models/quizz.models.dart';
import 'package:ziivah/models/subject.models.dart';

class Exercise {
  final String titre;
  final String niveau;
  final Subject matiere;
  final String chapitre;
  final Quizz quizz;
  final String objectId;
  final DateTime createdAt;
  final DateTime updateAt;

  Exercise({
    this.objectId,
    this.createdAt,
    this.updateAt,
    this.titre,
    this.niveau,
    this.matiere,
    this.chapitre,
    this.quizz,
  });
  Exercise.fromParse(ParseObject object)
      : titre = object.get('titre'),
        niveau = object.get('niveau'),
        chapitre = object.get('chapitre'),
        quizz = object.get('quizz') != null
            ? Quizz.fromParse(object.get('quizz'))
            : null,
        matiere = object.get('matiere') != null
            ? Subject.fromParse(object.get('matiere'))
            : null,
        objectId = object.objectId,
        createdAt = object.createdAt,
        updateAt = object.updatedAt;
}
