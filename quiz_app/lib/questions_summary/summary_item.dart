import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_app/questions_summary/question_identifier.dart';

class SummaryItem extends StatelessWidget {
  const SummaryItem(this.itemData, {super.key});

  final Map<String, Object> itemData;

  @override
  Widget build(BuildContext context) {
    final isCorrectAnswer =
        itemData['user_answer'] == itemData['correct_answer'];
    final userAnswer = itemData['user_answer'] as String;
    final correct = itemData['correct_answer'] as String;
    final question = itemData['question'] as String;

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        QuestionIdentifier(
          questionIndex: itemData['question_index'] as int,
          isCorrectAnswer: isCorrectAnswer,
        ),
        const SizedBox(width: 20),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Semantics(
                container: true,
                child: Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Text(
                        semanticsLabel: 'A pergunta era: $question',
                        question,
                        style: GoogleFonts.lato(
                            color: const Color.fromARGB(255, 30, 2, 61),
                            fontSize: 16,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        semanticsLabel: 'Você respondeu: $userAnswer',
                        userAnswer,
                        style: GoogleFonts.lato(
                            color: const Color.fromARGB(255, 30, 2, 61),
                            fontSize: 16,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        semanticsLabel: 'A resposta correta: $correct',
                        correct,
                        style: GoogleFonts.lato(
                            color: const Color.fromARGB(255, 24, 101, 27),
                            fontSize: 16,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
