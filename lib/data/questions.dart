import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:quize_app/models/quiz_question.dart';

Future<List<QuizQuestion>> loadQuestions() async {
  String jsonString = await rootBundle.loadString('assets/json/questions.json');
  List<dynamic> jsonList = json.decode(jsonString);

  List<QuizQuestion> questions = jsonList.map((json){
    return QuizQuestion(
      json['question'],
      List<String>.from(json['options']),
      );
  }).toList();

  return questions;
}
