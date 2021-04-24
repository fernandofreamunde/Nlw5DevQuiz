import 'package:flutter/material.dart';

import 'package:DevQuiz/challenge/widgets/answer/answer_widget.dart';
import 'package:DevQuiz/core/core.dart';
import 'package:DevQuiz/shared/models/answer_model.dart';
import 'package:DevQuiz/shared/models/question_model.dart';

class QuizWidget extends StatefulWidget {
  final QuestionModel question;
  final ValueChanged<bool> onSelected;

  const QuizWidget({
    Key? key,
    required this.question,
    required this.onSelected,
  }) : super(key: key);

  @override
  _QuizWidgetState createState() => _QuizWidgetState();
}

class _QuizWidgetState extends State<QuizWidget> {
  int indexSelected = -1;

  AnswerModel answers(int index) => widget.question.answers[index];

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          SizedBox(height: 24),
          Text(
            widget.question.title,
            style: AppTextStyles.heading,
          ),
          SizedBox(height: 34),
          for (var i = 0; i < widget.question.answers.length; i++) 
            AnswerWidget(
              answer: answers(i),
              isSelected: indexSelected == i,
              disabled: indexSelected != -1,
              onTap: (result) {
                indexSelected = i;
                //This causes a bug where the result on the last page
                //is not counted if the user presses confirm before the 1s elapses
                Future.delayed(Duration(seconds: 1)).then((_) => widget.onSelected(result));
                setState(() {});
              },
            )
          ,
        ],
      ),
    );
  }
}
