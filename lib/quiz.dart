import 'package:flutter/material.dart';
import 'package:quize_app/data/questions.dart';
import 'package:quize_app/models/quiz_question.dart';
import 'package:quize_app/question_screen.dart';
import 'package:quize_app/result_screen.dart';
import 'package:quize_app/start_screen.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  String activeScreen = 'start';
  List<String> selectedAnswers = [];
  late List<QuizQuestion> questions;

  void onScreenChange(String value) {
    setState(() {
      activeScreen = value;
    });
  }

  void onRestart(String value) {
    setState(() {
      selectedAnswers = [];
      activeScreen = value;
    });
  }

  void onAnswerSelect(String answer) {
    selectedAnswers.add(answer);
    if (selectedAnswers.length == questions.length) {
      setState(() {
        activeScreen = 'result';
      });
    }
  }

@override
  void initState() {
    super.initState();
    loadQuestions().then((loadedQuestions) {
      setState(() {
        questions = loadedQuestions;
      });
    }); 
  }

  @override
  Widget build(BuildContext context) {
    Widget? currentscreen = StartScreen(onAction: onScreenChange);
    if (activeScreen == 'start') {
      currentscreen = StartScreen(onAction: onScreenChange);
    }

    if (activeScreen == 'quiz') {
      currentscreen =
          QuestionScreen(
            onAnswer: onAnswerSelect, 
            onAction: onScreenChange,
            questions:questions,);
    }

    if (activeScreen == 'result') {
      currentscreen =
          ResultScreen(
            onAction: onRestart, 
            answerList: selectedAnswers,
            questions: questions,);
    }
    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: [Colors.white, Colors.blue.shade400],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter)),
          child: currentscreen,
        ),
      ),
    );
  }
}
