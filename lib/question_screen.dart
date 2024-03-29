import 'package:flutter/material.dart';
import 'package:quize_app/answer_button.dart';
import 'package:quize_app/models/quiz_question.dart';

class QuestionScreen extends StatefulWidget {
  const QuestionScreen(
      {super.key,
      required this.onAnswer,
      required this.onAction,
      required this.questions});

  final Function(String value) onAction;
  final Function(String value) onAnswer;
  final List<QuizQuestion> questions;

  @override
  State<QuestionScreen> createState() => _QuestionScreenState();
}

class _QuestionScreenState extends State<QuestionScreen> {
  late int currentQuestionIndex;

  void answerQuestion(String answer) {
    widget.onAnswer(answer);
    setState(() {
      currentQuestionIndex++;
    });
  }

  @override
  void initState() {
    super.initState();
    currentQuestionIndex = 0;
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Question No : ${currentQuestionIndex + 1}',
              style: const TextStyle(
                  fontSize: 23,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 1, 116, 209)),
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              widget.questions[currentQuestionIndex].question,
              textAlign: TextAlign.left,
              style: const TextStyle(color: Colors.black, fontSize: 23),
            ),
            const SizedBox(
              height: 18,
            ),
            ...widget.questions[currentQuestionIndex]
                .getRandonAnswers()
                .map((answer) => AnswerButton(
                    value: answer,
                    onAnswer: () {
                      answerQuestion(answer);
                    })),
            const SizedBox(
              height: 40,
            ),
            TextButton(
                onPressed: () {
                  widget.onAction('start');
                },
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.black)),
                child: const Text(
                  'Back to Start',
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ))
          ],
        ),
      ),
    );
  }
}
