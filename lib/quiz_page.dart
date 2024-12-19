import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'quiz.dart';

class QuizPage extends StatelessWidget {
  const QuizPage({super.key});

  @override
  Widget build(BuildContext context) {
    var quiz = Provider.of<Quiz>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Quiz App'),
        centerTitle: true,
        backgroundColor: Colors.teal,
      ),
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.teal, Colors.white],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: quiz.isQuizFinished
            ? Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.emoji_events,
                      color: Colors.amber[800],
                      size: 100,
                    ),
                    const SizedBox(height: 20),
                    Text(
                      'Your Score: ${quiz.totalScore}',
                      style: const TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        color: Colors.teal,
                      ),
                    ),
                    const SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: quiz.resetQuiz,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.teal,
                        padding: const EdgeInsets.symmetric(
                            vertical: 15, horizontal: 30),
                        textStyle: const TextStyle(fontSize: 18),
                      ),
                      child: const Text('Restart Quiz'),
                    ),
                  ],
                ),
              )
            : Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Container(
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.3),
                            blurRadius: 10,
                            spreadRadius: 2,
                            offset: const Offset(0, 5),
                          ),
                        ],
                      ),
                      child: Text(
                        quiz.questions[quiz.questionIndex]['questionText'],
                        style: const TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.teal,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    const SizedBox(height: 30),
                    ...(quiz.questions[quiz.questionIndex]['answers']
                            as List<Map<String, dynamic>>)
                        .map((answer) => Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 10.0),
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.teal,
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 15, horizontal: 30),
                                  textStyle: const TextStyle(fontSize: 18),
                                ),
                                onPressed: () =>
                                    quiz.answerQuestion(answer['score']),
                                child: Text(answer['text']),
                              ),
                            )),
                    const SizedBox(height: 20),
                    const Divider(
                      color: Colors.teal,
                      thickness: 2,
                    ),
                    const SizedBox(height: 10),
                    Text(
                      'Question ${quiz.questionIndex + 1} of ${quiz.questions.length}',
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 18,
                        fontStyle: FontStyle.italic,
                        color: Colors.teal,
                      ),
                    ),
                  ],
                ),
              ),
      ),
    );
  }
}
