import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myapp/data/quizz.dart';
import 'package:myapp/model/quiz_model.dart';
import 'package:myapp/questions_screen.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({super.key, required this.selectedAnswers});

  final List<String> selectedAnswers;

  @override
  Widget build(BuildContext context) {
    int numberOfCorrection(List<String> selectedAnswers) {
      int correctCount = 0;
      for (int i = 0; i < questions.length; i++) {
        if (i < selectedAnswers.length &&
            selectedAnswers[i] == questions[i].answers[0]) {
          correctCount++;
        }
      }
      return correctCount;
    }

    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Colors.pink,
                Colors.deepOrange,
              ],
            ),
          ),
          child: Center(
            child: Container(
              margin: const EdgeInsets.all(
                40,
              ),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'You Answered ${numberOfCorrection(selectedAnswers)} out of ${questions.length} correctly',
                      style: GoogleFonts.lato(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    ...questions.asMap().entries.map(
                      (entry) {
                        final index = entry.key;
                        final question = entry.value;
                        final correctAnswer = question.answers[0];
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
                                style: GoogleFonts.lato(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                'correct answer: ${correctAnswer}',
                                style: GoogleFonts.lato(
                                  color: Colors.white,
                                  fontSize: 18,
                                ),
                              ),
                            ),
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                'your answer: $selectedAnswer',
                                style: GoogleFonts.lato(
                                  color: Color(0xFF0000a0),
                                  fontSize: 18,
                                ),
                              ),
                            ),
                          ],
                        );
                      },
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    OutlinedButton.icon(
                      style: OutlinedButton.styleFrom(
                        side: BorderSide.none,
                      ),
                      onPressed: () {
                        Navigator.of(context).pushReplacement(MaterialPageRoute(
                            builder: (context) => const QuestionsScreen()));
                      },
                      icon: const Icon(
                        Icons.arrow_right_alt,
                        color: Colors.white,
                      ),
                      label: const Text(
                        'Restart Quiz',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
