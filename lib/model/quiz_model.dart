class QuizModel {
  String question;
  List<String> answers;

  QuizModel(this.question, this.answers);

  String get correctAnswer => answers[0];

}
