import 'package:flutter/material.dart';

import 'package:DevQuiz/core/app_text_styles.dart';
import 'package:DevQuiz/shared/widgets/progess_indicator/linear_progress_indicator_widget.dart';

class QuestionIndicatorWidget extends StatelessWidget {
  final int currentQuestion;
  final int length;

  const QuestionIndicatorWidget({
    Key? key,
    required this.currentQuestion,
    required this.length,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          SizedBox(height: 20,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Questao $currentQuestion", style: AppTextStyles.body,),
              Text("de $length", style: AppTextStyles.body,),
            ]
          ),
          SizedBox(height:16),
          LinearProgressIndicatorWidget(value: currentQuestion/length)
        ],
      ),
    );
  }
}
