import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_app/data/questions.dart';
import 'package:quiz_app/questions_summary/questions_summary.dart';

class ResultsScreen extends StatelessWidget {
  const ResultsScreen({
    super.key,
    required this.chosenAnswers,
    required this.onRestart,
  });

  final void Function() onRestart;
  final List<String> chosenAnswers;

  // This is a method which produces a list summary that it returns
  // If you have methods like this which take no input values
  // that just produces some data based on some class properties
  // you can use a getter instead with the get keyword
  // List<Map><String, Object>> getSummaryData() {
  List<Map<String, Object>> get summaryData {
    // this list is based on the chosenAnswers property
    final List<Map<String, Object>> summary = [];

    for (var i = 0; i < chosenAnswers.length; i++) {
      summary.add(
        {
          'question_index': i,
          'question': questions[i].text,
          'correct_answer': questions[i].answers[0],
          'user_answer': chosenAnswers[i]
        },
      );
    }

    return summary;
    // Text(((data['question_index'] as int) + 1).toString()),
  }

  @override
  Widget build(BuildContext context) {
    // Then using a getter we don't call it like a method anymore
    // final summaryData = summaryData();
    // we would simply refer to it as a variable summaryData
    // like this final summaryData = summaryData;
    // but now the creation of this variable is redundant
    final totalQuestionsNumber = questions.length;
    // a simple anonimous
    // now we access summaryData like a property or like a variable
    // enven though under the hood it is a method
    // final correctQuestionsNumber = summaryData.where((data) {
    final correctQuestionsNumber = summaryData
        .where(
          (data) => data['user_answer'] == data['correct_answer'],
        )
        .length;

    return SizedBox(
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Você respondeu $correctQuestionsNumber de $totalQuestionsNumber perguntas corretamente!',
              style: GoogleFonts.lato(
                color: const Color.fromARGB(255, 30, 2, 61),
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 30),
            QuestionsSummary(summaryData: summaryData),
            const SizedBox(height: 30),
            // TextButton.icon(
            //   onPressed: onRestart,
            //   style: TextButton.styleFrom(
            //     foregroundColor: const Color.fromARGB(255, 30, 2, 61),
            //   ),
            //   icon: const Icon(Icons.refresh),
            //   label: const Text('Restart Quis!'),
            // )
          ],
        ),
      ),
    );
  }
}
