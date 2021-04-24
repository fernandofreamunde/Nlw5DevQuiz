import 'package:flutter/foundation.dart';

class ChallengeController {
  final currentQuestionNotifyer = ValueNotifier<int>(0);
  int get currentQuestion => currentQuestionNotifyer.value;
  set currentQuestion(int value) => currentQuestionNotifyer.value = value;

  int correctCount = 0;
}
