// Suggested code may be subject to a license. Learn more: ~LicenseLog:1245054115.
import 'package:flutter/material.dart';
import 'package:myapp/controller/quiz_controller.dart';

class AnswerButton extends StatelessWidget {
  const AnswerButton(this.answerOption, {super.key});

  final String answerOption;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 5),
      child: ElevatedButton(
        onPressed: QuizController().nextQuestion,
        style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFFff7f27),
            foregroundColor: Colors.white,
            fixedSize: const Size(500, 20)),
        child: Text(answerOption),
      ),
    );
  }
}
