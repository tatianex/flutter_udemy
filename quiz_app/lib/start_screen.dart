import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class StartScreen extends StatelessWidget {
  const StartScreen(this.startQuiz, {super.key});

  final void Function() startQuiz;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          // This is one way of adding opacity although not the most recommended
          // Opacity(
          //   opacity: 0.5,
          //   child: Image.asset(
          //     'assets/images/quiz-logo.png',
          //     width: 300,
          //   ),
          // ),
          // It is also possible to add another color for an asset
          // Image.asset(
          //   'assets/images/quiz-logo.png',
          //   width: 300,
          //   color: Colors.red,
          // ),
          Image.asset(
            'assets/images/quiz-logo.png',
            width: 300,
            color: const Color.fromARGB(255, 30, 2, 61),
          ),
          const SizedBox(height: 80),
          Text(
            'Learn Flutter the fun way!',
            // style:
            //     TextStyle(color: Color.fromARGB(255, 30, 2, 61), fontSize: 24),
            style: GoogleFonts.lato(
              color: const Color.fromARGB(255, 30, 2, 61),
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 30),
          OutlinedButton.icon(
            // onPressed: () {
            //   startQuiz();
            // },
            onPressed: startQuiz,
            style: OutlinedButton.styleFrom(
              foregroundColor: const Color.fromARGB(255, 30, 2, 61),
            ),
            icon: const Icon(Icons.arrow_right_alt),
            label: const Text('Start Quiz'),
          )
        ],
      ),
    );
  }
}
