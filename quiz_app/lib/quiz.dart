import 'package:flutter/material.dart';
import 'package:quiz_app/data/questions.dart';
import 'package:quiz_app/questions_screen.dart';
import 'package:quiz_app/results_screen.dart';
import 'package:quiz_app/start_screen.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<Quiz> {
  List<String> selectedAnswers = [];
  // Here we are storing a widget/screen at a variable
  //Widget? activeScreen;
  var activeScreen = 'start-screen';

  // And for that we need the method initState() so we can call the switchScreen and it be already initialized so to say
  // @override
  // void initState() {
  //   activeScreen = StartScreen(switchScreen);
  //   super.initState();
  // }

  void switchScreen() {
    setState(() {
      activeScreen = 'questions-screen';
    });
  }

  void chooseAnswer(String answer) {
    selectedAnswers.add(answer);

    if (selectedAnswers.length == questions.length) {
      setState(() {
        //selectedAnswers = [];
        activeScreen = 'results-screen';
      });
    }
  }

  void restartQuiz() {
    setState(() {
      selectedAnswers = [];
      activeScreen = 'question-screen';
    });
  }

  @override
  Widget build(BuildContext context) {
    // Improves readability
    // final screenWidget = activeScreen == 'start-screen'
    //     ? StartScreen(switchScreen)
    //     : const QuestionsScreen();

    Widget screenWidget = StartScreen(switchScreen);

    // Best approach
    if (activeScreen == 'questions-screen') {
      screenWidget = QuestionsScreen(
        onSelectAnswer: chooseAnswer,
      );
    }

    if (activeScreen == 'results-screen') {
      screenWidget = ResultsScreen(
        chosenAnswers: selectedAnswers,
        onRestart: restartQuiz,
      );
    }

    return MaterialApp(
      home: Scaffold(
        body: Container(
          color: Colors.white,
          // Learned gradient in the course decided not to use it
          // decoration: const BoxDecoration(
          //   gradient: LinearGradient(
          //     colors: [
          //       Colors.white,
          //       Colors.white,
          //     ],
          //     begin: Alignment.topLeft,
          //     end: Alignment.bottomRight,
          //   ),
          // ),
          // It is a way of doing it but for readability it is better not
          // child: activeScreen == 'start-screen'
          //     ? StartScreen(switchScreen)
          //     : const QuestionsScreen(),
          child: screenWidget,
        ),
      ),
    );
  }
}
