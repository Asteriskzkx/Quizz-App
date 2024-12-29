import 'package:myapp/data/quizz.dart';
import 'package:myapp/model/quiz_model.dart';

class QuizController {
  int _currentQuestionIndex = 0;

  QuizModel getCurrentQuestion() {
    return questions[_currentQuestionIndex];
  }

  void nextQuestion() {
    if (_currentQuestionIndex < questions.length) {
      _currentQuestionIndex++;
    }
  }

  bool isLastQuestion() {
    return _currentQuestionIndex == questions.length;
  }
}
