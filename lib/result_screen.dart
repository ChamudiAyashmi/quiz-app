import 'package:flutter/material.dart';
import 'package:quize_app/models/quiz_question.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({
    super.key,
    required this.answerList,
    required this.onAction,
    required this.questions,
  });

  final Function(String value) onAction;
  final List<String> answerList;
  final List<QuizQuestion> questions;

  int calculateCorrectAnswerCount() {
    int correctAnswerCount = 0;

    for (var i = 0; i < answerList.length; i++) {
      if (answerList[i] == questions[i].answers[0]) {
        correctAnswerCount++;
      }
    }
    return correctAnswerCount;
  }

  List<Map<String, Object>> getSummary() {
    List<Map<String, Object>> summary = [];

    for (var i = 0; i < answerList.length; i++) {
      summary.add({
        'questionIndex': i,
        'question': questions[i].question,
        'correct_answer': questions[i].answers[0],
        'user_answer': answerList[i],
      });
    }
    return summary;
  }

  @override
  Widget build(BuildContext context) {
    int correctAnswerCount = calculateCorrectAnswerCount();
    int totalMarks = correctAnswerCount * 5;

    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(
            height: 28,
          ),
          const Text(
            'Results',
            textAlign: TextAlign.center,
            style: TextStyle(
                color: Color.fromARGB(255, 1, 121, 219),
                fontSize: 28,
                fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            '$correctAnswerCount out of ${questions.length} is correct',
            textAlign: TextAlign.center,
            style: const TextStyle(
                color: Color.fromARGB(255, 1, 121, 219),
                fontSize: 28,
                fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            'Total Marks : ${totalMarks}',
            style: const TextStyle(
                fontSize: 25, color: Colors.red, fontWeight: FontWeight.bold),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: questions.length,
              itemBuilder: (context, index) {
                final summaryItem = getSummary()[index];

                return Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Question ${index + 1}',
                        style: const TextStyle(
                            fontSize: 23, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        'Correct Answer: ${summaryItem['correct_answer']}',
                        style: const TextStyle(fontSize: 20),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        'Given Answer: ${summaryItem['user_answer']}',
                        style: const TextStyle(fontSize: 20),
                      ),
                      const SizedBox(
                        height: 20,
                      )
                    ],
                  ),
                );
              },
            ),
          ),
          OutlinedButton(
            onPressed: () {
              onAction('start');
            },
            style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(
                    const Color.fromARGB(255, 1, 120, 218))),
            child: const Text(
              'Restart',
              style: TextStyle(fontSize: 20, color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}
