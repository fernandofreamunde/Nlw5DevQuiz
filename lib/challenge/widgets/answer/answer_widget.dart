import 'package:DevQuiz/core/app_colors.dart';
import 'package:DevQuiz/core/core.dart';
import 'package:DevQuiz/shared/models/answer_model.dart';
import 'package:flutter/material.dart';

class AnswerWidget extends StatelessWidget {
  final AnswerModel answer;
  final bool isSelected;
  final bool disabled;
  final ValueChanged<bool> onTap;

  const AnswerWidget({
    Key? key, 
    required this.answer,
    required this.onTap,
    this.isSelected = false,
    this.disabled = false
  }) : super(key: key);

  Color get _selectedColorCorrect => answer.isCorrect ? AppColors.darkGreen : AppColors.darkRed;
  Color get _selectedBorderCorrect => answer.isCorrect ? AppColors.lightGreen : AppColors.lightRed;
  Color get _selectedCardCorrect => answer.isCorrect ? AppColors.lightGreen : AppColors.lightRed;
  Color get _selectedBorderCardCorrect => answer.isCorrect ? AppColors.green : AppColors.red;
  TextStyle get _selectedTextStyleCorrect => answer.isCorrect ? AppTextStyles.bodyDarkGreen : AppTextStyles.bodyDarkRed;
  IconData get _selectedIconCorrect => answer.isCorrect ? Icons.check : Icons.close;

  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
        ignoring: disabled,
          child: GestureDetector(
          onTap: () {
            onTap(answer.isCorrect);
          },
          child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 4),
          child: Container(
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: isSelected ? _selectedCardCorrect : AppColors.white,
              borderRadius: BorderRadius.circular(10),
              border: Border.fromBorderSide(
                BorderSide(
                  color: isSelected ? _selectedBorderCardCorrect : AppColors.border
                )
              )
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    answer.title, 
                    style: isSelected ? _selectedTextStyleCorrect : AppTextStyles.body,
                  )
                ),
                Container(
                  width: 24,
                  height: 24,
                  decoration: BoxDecoration(
                    color: isSelected ? _selectedColorCorrect : AppColors.white,
                    borderRadius: BorderRadius.circular(500),
                    border: Border.fromBorderSide(
                      BorderSide(color: isSelected ? _selectedBorderCorrect : AppColors.border)
                    )
                  ),
                  child: isSelected ? Icon(
                    _selectedIconCorrect, 
                    size: 16, 
                    color: AppColors.white
                  ) : null,
                )
              ]
            ),
          ),
        ),
      ),
    );
  }
}
