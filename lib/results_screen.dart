import 'package:adv_basics/data/questions.dart';
import 'package:adv_basics/questions_summery.dart';
import 'package:flutter/material.dart';

class ResultsScreen extends StatelessWidget {
  const ResultsScreen({super.key, required this.selectedAnswers, required this.onRestart});

  final List<String> selectedAnswers;
  final void Function() onRestart;

  List<Map<String, Object>> get summaryData {
    final List<Map<String, Object>> summaryData = [];
    for (var i = 0; i < selectedAnswers.length; i++) {
      summaryData.add({
        'question_index': i,
        'question': questions[i].text,
        'correct_answer': questions[i].answers[0],
        'user_answer': selectedAnswers[i],
        'is_correct': questions[i].answers[0] == selectedAnswers[i],
      });
    }
    return summaryData;
  }

  @override
  Widget build(BuildContext context) {
    final numberTotalQuestions = questions.length;
    final numberCorrectAnswers = summaryData.where((data) {
      return data['correct_answer'] == data['user_answer'];
    }).length;
    return Center(
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
             Text(
              'You answer $numberCorrectAnswers out of $numberTotalQuestions questions correctly!',
              style: TextStyle(color: Colors.white, fontSize: 15),
            ),
            SizedBox(height: 20),
            QuestionsSummery(summaryData),
            SizedBox(height: 20),
            TextButton(
              onPressed: () {
                onRestart();
              },
              child: const Text(
                'Restart Quiz',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
