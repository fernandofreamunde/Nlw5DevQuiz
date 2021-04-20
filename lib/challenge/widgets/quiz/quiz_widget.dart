import 'package:DevQuiz/challenge/widgets/answer/answer_widget.dart';
import 'package:DevQuiz/core/core.dart';
import 'package:flutter/material.dart';

class QuizWidget extends StatelessWidget {
  final String title;
  const QuizWidget({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Text(
            title,
            style: AppTextStyles.heading,
          ),
          SizedBox(height: 24),
          AnswerWidget(title: "Kit de desenvolvimento de interface de usuário", isCorrect: true, isSelected: true),
          AnswerWidget(title: "Possibilita a criação de aplicativos compilados nativamente", isCorrect: false, isSelected: true),
          AnswerWidget(title: "Acho que é uma marca de café do Himalaia", isCorrect: true, isSelected: false),
          AnswerWidget(title: "Possibilita a criação de desktops que são muito incríveis", isCorrect: false, isSelected: false),
        ],
      ),
    );
  }
}
