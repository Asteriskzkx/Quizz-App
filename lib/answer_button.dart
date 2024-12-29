import 'package:flutter/material.dart';

class AnswerButton extends StatelessWidget {
  const AnswerButton(this.answerOption, {super.key, required this.onPressed});

  final String answerOption;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 5),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFFff7f27),
            foregroundColor: Colors.white,
            fixedSize: const Size(500, 20)),
        child: Text(answerOption),
      ),
    );
  }
}
