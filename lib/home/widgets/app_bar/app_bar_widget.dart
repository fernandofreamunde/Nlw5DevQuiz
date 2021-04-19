import 'package:DevQuiz/core/app_gradients.dart';
import 'package:DevQuiz/core/core.dart';
import 'package:DevQuiz/home/widgets/score_card/score_card.widget.dart';
import 'package:flutter/material.dart';

class AppBarWidget extends PreferredSize {
  AppBarWidget() : super(
    preferredSize: Size.fromHeight(250),
    child: Container(
      height: 250,
      child: Stack(
        children: [
          Container(
            height: 161,
            padding: const EdgeInsets.only(left: 20, right: 20),
            width: double.maxFinite,
            decoration: BoxDecoration(gradient: AppGradients.linear),
            child: 
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text.rich(
                    TextSpan(
                      text: "Ola, ", style: AppTextStyles.title,
                      children: [
                        TextSpan(text: "Fernando", style: AppTextStyles.titleBold),
                      ]),
                  ),
                  Container(
                    width: 58,
                    height: 58,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      image: DecorationImage(
                        image: NetworkImage("https://media-exp1.licdn.com/dms/image/C4E03AQGdPlM4z2SWLA/profile-displayphoto-shrink_100_100/0/1521462525176?e=1624492800&v=beta&t=n4NeqlHdVMYn6kNuYirN3XVqFzNan-x7yaV6Q94RheQ")
                      )
                    ),
                  )
                ],
              ),
            
          ),
          Align(
            alignment: Alignment(0, 1),
            child: ScoreCardWidget()
          )
        ]
      ),
    )
  );
}