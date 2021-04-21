import 'package:DevQuiz/core/app_images.dart';
import 'package:DevQuiz/home/home_state.dart';
import 'package:DevQuiz/shared/models/answer_model.dart';
import 'package:DevQuiz/shared/models/question_model.dart';
import 'package:DevQuiz/shared/models/quiz_model.dart';
import 'package:DevQuiz/shared/models/user_model.dart';
import 'package:flutter/foundation.dart';

class HomeController {
  final stateNotifier = ValueNotifier<HomeState>(HomeState.empty);

  set state(HomeState state) => stateNotifier.value = state;
  HomeState get state => stateNotifier.value;
  
  UserModel? user;
  List<QuizModel>? quizzes;

  void getUser() async {
    state = HomeState.loading;
    await Future.delayed(Duration(seconds: 2));

    user = UserModel(
      name: "Fernando", 
      photoUrl: "https://media-exp1.licdn.com/dms/image/C4E03AQGdPlM4z2SWLA/profile-displayphoto-shrink_100_100/0/1521462525176?e=1624492800&v=beta&t=n4NeqlHdVMYn6kNuYirN3XVqFzNan-x7yaV6Q94RheQ", 
      score: 0
    );

    state = HomeState.success;
  }

  void getQuizzes() async {
    state = HomeState.loading;
    await Future.delayed(Duration(seconds: 2));

    quizzes = [
      QuizModel(
        title: "NLW#5 Flutter", 
        questions: [
          QuestionModel(
            title: "Estas a gostar do Flutter? ",
            answers: [
              AnswerModel(
                title: "Nem Por isso."
              ),
              AnswerModel(
                title: "Ainda tenho duvidas",
              ),
              AnswerModel(
                title: "Eh uma porcaria",
              ),
              AnswerModel(
                title: "Estou a adorar",
                isCorrect: true
              ),
            ]
          ),
          QuestionModel(
            title: "O que faz o Flutter?",
            answers: [
              AnswerModel(
                title: "Faz apps para muitas plataformas.",
                isCorrect: true
              ),
              AnswerModel(
                title: "Faz deploy facil.",
              ),
              AnswerModel(
                title: "Traduz movimentos em  ondas de som.",
              ),
              AnswerModel(
                title: "Faz bananas."
              ),
            ]
          ),
          QuestionModel(
            title: "Com o Flutter podemos fazer sites? ",
            answers: [
              AnswerModel(
                title: "Nem Por isso."
              ),
              AnswerModel(
                title: "Podemos",
                isCorrect: true
              ),
              AnswerModel(
                title: "Depende, se o site for estatico.",
              ),
              AnswerModel(
                title: "Depende, se o site for dinamico."
              ),
            ]
          ),
        ], 
        image: AppImages.blocks, 
        level: Level.facil
      ),
    ];

    state = HomeState.success;
  }
}
