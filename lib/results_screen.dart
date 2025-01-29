import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myapp/data/quizz.dart';
import 'package:myapp/question_summary.dart';
import 'package:myapp/start_screen.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({super.key, required this.selectedAnswers});

  final List<String> selectedAnswers; // user selected answers

  List<Map<String, Object>> getSummaryData() {
    List<Map<String, Object>> summaryData = [];

    for (int i = 0; i < selectedAnswers.length; i++) {
      bool isCorrect = selectedAnswers[i] == questions[i].answers[0];
      summaryData.add({
        'question_id': i,
        'question': questions[i].question,
        'correct_answer': questions[i].answers[0],
        'user_answer': selectedAnswers[i],
        'is_correct': isCorrect,
      });
    }
    return summaryData;
  }

  @override
  Widget build(BuildContext context) {
    final summaryData = getSummaryData();
    final totalMark =
        summaryData.where((data) => data['is_correct'] as bool).length;
    final totalQuestion = questions.length;

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
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'You Answered $totalMark out of $totalQuestion questions correctly',
                    style: GoogleFonts.lato(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  QuestionSummary(summaryData: getSummaryData()),
                  const SizedBox(
                    height: 40,
                  ),
                  OutlinedButton.icon(
                    style: OutlinedButton.styleFrom(
                      side: BorderSide.none,
                    ),
                    onPressed: () {
                      Navigator.of(context).pushReplacement(MaterialPageRoute(
                          builder: (context) => const StartScreen()));
                    },
                    icon: const Icon(
                      Icons.restart_alt,
                      color: Colors.white,
                    ),
                    label: const Text(
                      'Restart Quiz',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                      ),
                    ),
                  ),
                ],
                //   children: [
                //     Text(
                //       'You Answered ${numberOfCorrection(selectedAnswers)} out of ${questions.length} correctly',
                //       style: GoogleFonts.lato(
                //         color: Colors.white,
                //         fontSize: 24,
                //         fontWeight: FontWeight.bold,
                //       ),
                //       textAlign: TextAlign.center,
                //     ),
                //     const SizedBox(
                //       height: 15,
                //     ),
                //     ...questions.asMap().entries.map(
                //       (entry) {
                //         final index = entry.key;
                //         final question = entry.value;
                //         final correctAnswer = question.answers[0];
                //         final selectedAnswer = index < selectedAnswers.length
                //             ? selectedAnswers[index]
                //             : 'Not Answered';
                //         return Column(
                //           crossAxisAlignment: CrossAxisAlignment.start,
                //           children: [
                //             Align(
                //               alignment: Alignment.centerLeft,
                //               child: Text(
                //                 '${index + 1}: ${question.question}',
                //                 style: GoogleFonts.lato(
                //                   color: Colors.white,
                //                   fontSize: 20,
                //                   fontWeight: FontWeight.bold,
                //                 ),
                //               ),
                //             ),
                //             Align(
                //               alignment: Alignment.centerLeft,
                //               child: Text(
                //                 'correct answer: ${correctAnswer}',
                //                 style: GoogleFonts.lato(
                //                   color: Colors.white,
                //                   fontSize: 18,
                //                 ),
                //               ),
                //             ),
                //             Align(
                //               alignment: Alignment.centerLeft,
                //               child: Text(
                //                 'your answer: $selectedAnswer',
                //                 style: GoogleFonts.lato(
                //                   color: Color(0xFF0000a0),
                //                   fontSize: 18,
                //                 ),
                //               ),
                //             ),
                //           ],
                //         );
                //       },
                //     ),
                //     const SizedBox(
                //       height: 40,
                //     ),
                //     OutlinedButton.icon(
                //       style: OutlinedButton.styleFrom(
                //         side: BorderSide.none,
                //       ),
                //       onPressed: () {
                //         Navigator.of(context).pushReplacement(MaterialPageRoute(
                //             builder: (context) => const QuestionsScreen()));
                //       },
                //       icon: const Icon(
                //         Icons.arrow_right_alt,
                //         color: Colors.white,
                //       ),
                //       label: const Text(
                //         'Restart Quiz',
                //         style: TextStyle(
                //           color: Colors.white,
                //         ),
                //       ),
                //     ),
                //   ],
                //
              ),
            ),
          ),
        ),
      ),
    );
  }
}
