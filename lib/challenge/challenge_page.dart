import 'package:flutter/material.dart';
import 'package:DevQuiz/challenge/challenge_controller.dart';
import 'package:DevQuiz/challenge/widgets/next_button/next_button_widget.dart';
import 'package:DevQuiz/challenge/widgets/question_indicator/question_indicator_widget.dart';
import 'package:DevQuiz/challenge/widgets/quiz/quiz_widget.dart';
import 'package:DevQuiz/result/result_page.dart';
import 'package:DevQuiz/shared/models/question_model.dart';

class ChallengePage extends StatefulWidget {

  final List<QuestionModel> questions;
  final String quizTitle;

  ChallengePage({
    Key? key,
    required this.questions,
    required this.quizTitle,
  }) : super(key: key);

  @override
  _ChallengePageState createState() => _ChallengePageState();
}

class _ChallengePageState extends State<ChallengePage> {

  final controller = ChallengeController();
  final pageController = PageController();
  
  @override
  void initState() {
    pageController.addListener(() {
      controller.currentQuestion = pageController.page!.toInt() + 1;
    });
    super.initState();
  }

  void nextPage() {
    if (controller.currentQuestion < widget.questions.length) {
      pageController.nextPage(
        duration: Duration(milliseconds: 100), 
        curve: Curves.linear
      );
    }
  }

  void onSelected(bool result) {
    print("Selected with Value: $result");
    if (result) {
      controller.correctCount++;
    }
    nextPage();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(80),
        child: SafeArea(
          top: true,
          child: Column(
            // se quisermos ter um back button, 
            // mas o ios e android tem forma nativa de activar
            // swipe no ios e triangulo no android
            // crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // BackButton(),
              ValueListenableBuilder<int>(
                valueListenable: controller.currentQuestionNotifyer, 
                builder: (context, value, _) =>
                  QuestionIndicatorWidget(
                    currentQuestion: value,
                    length: widget.questions.length,
                  )
              ),
            ],
          )
        ),
      ),

      body: PageView(
        physics: NeverScrollableScrollPhysics(),
        controller: pageController,
        children: widget.questions.map((e) => QuizWidget(
          question: e,
          onSelected: onSelected,
          )).toList() 
      ),

      bottomNavigationBar: SafeArea(
        bottom: true,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: ValueListenableBuilder<int>(
                valueListenable: controller.currentQuestionNotifyer, 
                builder: (context, value, _) => Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    if (value != widget.questions.length)
                      Expanded(child: NextButtonWidget.white(label: 'Saltar', onTap: nextPage)),
                    if (value == widget.questions.length)
                      Expanded(
                        child: NextButtonWidget.green(label: 'Confirmar', onTap: () {
                          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) 
                            => ResultPage(
                                title: widget.quizTitle,
                                questionCount: widget.questions.length,
                                correctCuestionCount: controller.correctCount,
                              )
                            )
                          );
                        }),
                      ),
                  ],
                ),
              ),
        ),
      ),
    );
  }
}
