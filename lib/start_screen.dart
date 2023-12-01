import 'package:flutter/material.dart';

class StartScreen extends StatelessWidget {
  const StartScreen({super.key, required this.onAction});

  final Function(String value) onAction;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            'assets/images/quiz-cover.png',
            width: 300,
          ),
          const SizedBox(
            height: 20,
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 40, vertical: 10),
            child: Text(
              'Let\'s do some refreshment on Flutter',
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.white, fontSize: 28),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          SizedBox(
            width: 150,
            height: 40,
            child: OutlinedButton(
                onPressed: () {
                  onAction('quiz');
                },
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(
                        const Color.fromARGB(255, 1, 89, 240)),
                    shape: MaterialStateProperty.all<OutlinedBorder>(
                        RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)))),
                child: const Text(
                  'Start Quiz',
                  style: TextStyle(fontSize: 20, color: Colors.white),
                )),
          )
        ],
      ),
    );
  }
}
