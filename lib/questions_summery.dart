import 'package:flutter/material.dart';

class QuestionsSummery extends StatelessWidget {
  const QuestionsSummery(this.summaryData, {super.key});

  final List<Map<String, Object>> summaryData;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: SingleChildScrollView(
        child: Column(
          children:
              summaryData.map((data) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 15),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: 30,
                        height: 30,
                        alignment: Alignment.center,
                        margin: const EdgeInsets.only(right: 20),
                        decoration: BoxDecoration(
                          color: data['is_correct'] as bool ? Colors.green : Colors.red,
                          borderRadius: BorderRadius.circular(200)
                        ),
                        child: Text(
                          ((data['question_index'] as int) + 1).toString(),
                        ),
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              data['question'] as String,
                              style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 5),
                            Text(data['user_answer'] as String),
                            Text(data['correct_answer'] as String),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              }).toList(),
        ),
      ),
    );
  }
}
