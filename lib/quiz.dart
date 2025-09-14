import 'package:adv_basics/data/questions.dart';
import 'package:adv_basics/questions_screen.dart';
import 'package:adv_basics/results_screen.dart';
import 'package:adv_basics/start_screen.dart';
import 'package:flutter/material.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});
  @override
  State<Quiz> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<Quiz> {
  List<String> selectedAnswers = [];
  var activeScreen = 'start-screen';

  void switchScreen() {
    setState(() {
      activeScreen = 'questions-screen';
    });
  }

  void handleChangeAnswer(String answer) {
    selectedAnswers.add(answer);
    if (selectedAnswers.length == questions.length) {
      setState(() {
        activeScreen = 'result-screen';
      });
    }
  }

  void handleRestartAnswers() {
    selectedAnswers.clear();
    setState(() {
      activeScreen = 'start-screen';
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget activeScreenView = StartScreen(switchScreen);
    if (activeScreen == 'questions-screen') {
      activeScreenView = QuestionsScreen(onSelectAnswer: handleChangeAnswer);
    } else if (activeScreen == 'result-screen') {
      activeScreenView = ResultsScreen(
        selectedAnswers: selectedAnswers,
        onRestart: handleRestartAnswers,
      );
    }
    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Colors.deepPurple,
                const Color.fromARGB(255, 137, 58, 183),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: activeScreenView,
        ),
      ),
    );
  }
}
