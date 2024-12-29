import 'package:flutter/material.dart';
import 'package:myapp/answer_button.dart';
import 'package:myapp/controller/quiz_controller.dart';
import 'package:myapp/data/quizz.dart';
import 'package:myapp/result_screen.dart';

class QuestionsScreen extends StatefulWidget {
  const QuestionsScreen({super.key});

  @override
  State<QuestionsScreen> createState() {
    return _QuestionsScreenState();
  }
}

class _QuestionsScreenState extends State<QuestionsScreen> {
  final QuizController _quizController = QuizController();
  int _correctAnswers = 0;
  List<String> _selectedAnswers = [];

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
                    _quizController.getCurrentQuestion().question,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  ...(_quizController.getCurrentQuestion().answers).map(
                    (answer) {
                      return AnswerButton(
                        answer,
                        onPressed: () {
                          _selectedAnswers.add(answer);

                          if (answer ==
                              _quizController
                                  .getCurrentQuestion()
                                  .correctAnswer) {
                            setState(() {
                              _correctAnswers++;
                            });
                          }

                          setState(() {
                            _quizController.nextQuestion();
                            if (_quizController.isLastQuestion()) {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => ResultScreen(
                                            numCorrectAnswers: _correctAnswers,
                                            selectedAnswers: _selectedAnswers,
                                          )));
                            }
                          });
                        },
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
