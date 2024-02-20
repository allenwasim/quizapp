import 'package:flutter/material.dart';

class QuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  int currentQuestionIndex = 0;
  List<Map<String, dynamic>> questions = [
    {
      'question': 'Flutter is developed by Google.',
      'answer': true,
    },
    {
      'question': 'Dart is a compiled language.',
      'answer': true,
    },
    {
      'question': 'Widgets in Flutter are immutable.',
      'answer': true,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Question ${currentQuestionIndex + 1}:',
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
          SizedBox(height: 20),
          Text(
            questions[currentQuestionIndex]['question'],
            style: TextStyle(color: Colors.white, fontSize: 16),
          ),
          Spacer(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                  onPressed: () {
                    checkAnswer(true);
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Colors.green,
                    fixedSize: Size(120, 50),
                  ),
                  child: Text('True'),
                ),
                ElevatedButton(
                  onPressed: () {
                    checkAnswer(false);
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Colors.blue,
                    fixedSize: Size(120, 50),
                  ),
                  child: Text('False'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void checkAnswer(bool selectedAnswer) {
    bool correctAnswer = questions[currentQuestionIndex]['answer'];

    if (selectedAnswer == correctAnswer) {
      print('Correct!');
    } else {
      print('Incorrect!');
    }

    setState(() {
      if (currentQuestionIndex < questions.length - 1) {
        currentQuestionIndex++;
      } else {
        print('End of Quiz');
      }
    });
  }
}
