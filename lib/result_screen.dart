import 'package:flutter/material.dart';
import 'package:myapp/data/quizz.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({
    super.key,
    required this.numCorrectAnswers,
    required this.selectedAnswers,
  });

  final int numCorrectAnswers;
  final List<String> selectedAnswers;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.pink, Colors.deepOrange],
            ),
          ),
          child: Center(
            child: Container(
              margin: const EdgeInsets.all(40),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'You answered $numCorrectAnswers out of ${questions.length} questions correctly!',
                    style: const TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 15),
                  ...questions.asMap().entries.map(
                    (entry) {
                      final index = entry.key;
                      final question = entry.value;
                      final selectedAnswer = index < selectedAnswers.length
                          ? selectedAnswers[index]
                          : 'Not Answered';

                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              '${index + 1}: ${question.question}',
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              'correct answer: ${question.correctAnswer}',
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                              ),
                            ),
                          ),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              'your answer: $selectedAnswer',
                              style: const TextStyle(
                                color: Color(0xFF0000a0),
                                fontSize: 14,
                              ),
                            ),
                          ),
                          const SizedBox(height: 5),
                        ],
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
