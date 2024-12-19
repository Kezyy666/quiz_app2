import 'package:flutter/foundation.dart';

class Quiz with ChangeNotifier {
  final List<Map<String, dynamic>> _questions = [
    {
      'questionText': 'What is Flutter?',
      'answers': [
        {'text': 'A programming language', 'score': 0},
        {'text': 'A web framework', 'score': 0},
        {'text': 'A mobile UI framework', 'score': 1},
        {'text': 'A game', 'score': 0},
      ],
    },
    {
      'questionText': 'What language is Flutter written in?',
      'answers': [
        {'text': 'Dart', 'score': 1},
        {'text': 'Java', 'score': 0},
        {'text': 'Kotlin', 'score': 0},
        {'text': 'Swift', 'score': 0},
      ],
    },
    // Add more questions here
  ];

  int _questionIndex = 0;
  int _totalScore = 0;

  void answerQuestion(int score) {
    _totalScore += score;
    _questionIndex++;
    notifyListeners();
  }

  int get questionIndex => _questionIndex;
  int get totalScore => _totalScore;
  List<Map<String, dynamic>> get questions => _questions;

  bool get isQuizFinished => _questionIndex >= _questions.length;

  void resetQuiz() {
    _questionIndex = 0;
    _totalScore = 0;
    notifyListeners();
  }
}
