import 'package:flutter/material.dart';
import 'package:quiz_app/questions_summary/summary_item.dart';

class QuestionsSummary extends StatelessWidget {
  const QuestionsSummary({super.key, required this.summaryData});

  final List<Map<String, Object>> summaryData;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 400,
      child: SingleChildScrollView(
        // child: Column(
        //   children: summaryData.map(
        //     (data) {
        //       return Row(
        //         children: [
        //           Text(((data['question_index'] as int) + 1).toString()),
        //           Expanded(
        //             child: Column(
        //               children: [
        //                 Text(data['question'] as String),
        //                 const SizedBox(height: 8),
        //                 Text(data['user_answer'] as String),
        //                 Text(data['correct_answer'] as String)
        //               ],
        //             ),
        //           )
        //         ],
        //       );
        //     },
        //   ).toList(),
        // ),
        child: Column(
          children: summaryData.map(
            (data) {
              return SummaryItem(data);
            },
          ).toList(),
        ),
      ),
    );
  }
}
