import 'package:esiask/models/questions_model.dart' as questions_model;

import '../const.dart';

void addQuestiontoDatabase(String title, String description, String taggedfiliere) async {
 

  questions_model.Questions questions = questions_model.Questions(
    title:title,
    description: description,
    taggedfiliere: taggedfiliere);


  await firebaseFirestore
      .collection('Questions')
      .doc(title)
      .set(questions.toJson());
}