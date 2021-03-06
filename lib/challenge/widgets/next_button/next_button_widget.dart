import 'package:DevQuiz/core/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class NextButtonWidget extends StatelessWidget {
  final String label;
  final Color backgroundColor;
  final Color textColor;
  final Color border;
  final Color overlayColor;
  final VoidCallback onTap;

  const NextButtonWidget({
    required this.label,
    required this.backgroundColor,
    required this.textColor,
    required this.border, 
    required this.overlayColor, 
    required this.onTap
  });

  NextButtonWidget.green({required String label, required VoidCallback onTap})
    : this.backgroundColor = AppColors.darkGreen, 
    this.textColor = AppColors.white, 
    this.border = AppColors.darkGreen, 
    this.overlayColor = AppColors.green, 
    this.label = label,
    this.onTap = onTap;

  NextButtonWidget.white({required String label, required VoidCallback onTap})
    : this.backgroundColor = AppColors.white, 
    this.textColor = AppColors.lightGrey, 
    this.border = AppColors.border,
    this.overlayColor = AppColors.green, 
    this.label = label,
    this.onTap = onTap;

  NextButtonWidget.purple({required String label, required VoidCallback onTap})
    : this.backgroundColor = AppColors.purple, 
    this.textColor = AppColors.white, 
    this.border = AppColors.border,
    this.overlayColor = AppColors.green, 
    this.label = label,
    this.onTap = onTap;

  @override
  Widget build(BuildContext context) {
    //Todo change overley on tap
    return Container(
      height: 48,
      child: TextButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(
            backgroundColor
          ),
          overlayColor: MaterialStateProperty.all<Color>(overlayColor),
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            )
          ),
          side: MaterialStateProperty.all(
            BorderSide(color: border)
          )
        ),
        onPressed: onTap, 
        child: Text(
          label,
          style: GoogleFonts.notoSans(
            fontWeight: FontWeight.w600,
            fontSize: 15,
            color: textColor
          ),
          )
      )
    );
  }
}
