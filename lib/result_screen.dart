// import 'package:flutter/material.dart';
// import 'package:quize_app/models/quiz_question.dart';

// class ResultScreen extends StatelessWidget {
//   const ResultScreen(
//       {super.key,
//       required this.answerList,
//       required this.onAction,
//       required this.questions});

//   final Function(String value) onAction;
//   final List<String> answerList;
//   final List<QuizQuestion> questions;

//   List<Map<String, Object>> getSummary() {
//     List<Map<String, Object>> summary = [];

//     for (var i = 0; i < answerList.length; i++) {
//       summary.add({
//         'questionIndex': i,
//         'question': questions[i].question,
//         'correct_answer': questions[i].answers[0],
//         'user_answer': answerList[i],
//       });
//     }
//     return summary;
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       child: Column(
//         mainAxisSize: MainAxisSize.min,
//         children: [
//           const Text(
//             'Results',
//             textAlign: TextAlign.center,
//             style: TextStyle(color: Colors.white, fontSize: 28),
//           ),
//           ...getSummary()
//               .map((s) => Text(((s['questionIndex'] as int) + 1).toString())),
//           OutlinedButton(
//               onPressed: () {
//                 onAction('start');
//               },
//               child: const Text('Restart'))
//         ],
//       ),
//     );
//   }
// }

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
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(
            height: 20,
          ),
          const Text(
            'Results',
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.white, fontSize: 28),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: questions.length,
              itemBuilder: (context, index) {
                final summaryItem = getSummary()[index];

                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Question ${index + 1}'),
                      const SizedBox(
                        height: 10,
                      ),
                      Text('Correct Answer: ${summaryItem['correct_answer']}'),
                      Text('Given Answer: ${summaryItem['user_answer']}'),
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
            child: const Text('Restart'),
          ),
        ],
      ),
    );
  }
}
