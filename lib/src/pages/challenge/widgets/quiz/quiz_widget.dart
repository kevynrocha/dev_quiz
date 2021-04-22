import 'package:flutter/material.dart';

import '../../../../../core/core.dart';
import '../answer/answer_widget.dart';

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
          SizedBox(
            height: 24,
          ),
          AnswerWidget(
            title: 'Possibilita a criação de desktops que são muito incríveis',
            isRight: true,
            isSelected: true,
          ),
          AnswerWidget(
            title: 'Possibilita a criação de desktops que são muito incríveis',
            isRight: false,
            isSelected: true,
          ),
          AnswerWidget(
            title: 'Possibilita a criação de desktops que são muito incríveis',
            isRight: false,
            isSelected: false,
          ),
          AnswerWidget(
            title: 'Possibilita a criação de desktops que são muito incríveis',
            isRight: true,
            isSelected: false,
          )
        ],
      ),
    );
  }
}
