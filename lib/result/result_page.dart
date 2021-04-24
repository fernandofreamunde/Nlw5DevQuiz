import 'package:flutter/material.dart';

import 'package:DevQuiz/challenge/widgets/next_button/next_button_widget.dart';
import 'package:DevQuiz/core/core.dart';

class ResultPage extends StatelessWidget {
  final String title;
  final int questionCount;
  final int correctCuestionCount;

  const ResultPage({
    Key? key,
    required this.title,
    required this.questionCount,
    required this.correctCuestionCount,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.maxFinite,
        padding: EdgeInsets.only(top:100),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(AppImages.trophy),
            Column(children: [
              Text("Parabéns!", style: AppTextStyles.heading40),
              SizedBox(height:16),
              Text.rich(
                TextSpan(text: "Você concluiu", style: AppTextStyles.body, 
                  children: [
                    TextSpan(text: "\n$title", style: AppTextStyles.bodyBold, ),
                    TextSpan(text: "\ncom $correctCuestionCount de $questionCount acertos.", style: AppTextStyles.body, ),
                  ]
                ), textAlign: TextAlign.center,
              ),
            ],),
            SizedBox(height:16),
            Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 68),
                        child: NextButtonWidget.purple(label: "Compartilhar", onTap: () {}),
                      )
                    ),
                  ],
                ),
                SizedBox(height:24),
                Row(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 68),
                        child: NextButtonWidget.white(label: "Voltar ao  inicio", onTap: () {
                          Navigator.pop(context);
                        }),
                      )
                    ),
                  ],
                ),
              ],
            )
          ],
        ),
      )
    );
  }
}
