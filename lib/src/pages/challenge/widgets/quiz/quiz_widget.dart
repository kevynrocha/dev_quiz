import 'package:flutter/material.dart';

import '../../../../shared/models/question_model.dart';
import '../../../../../core/core.dart';
import '../answer/answer_widget.dart';

class QuizWidget extends StatefulWidget {
  final QuestionModel question;
  final VoidCallback onChange;

  const QuizWidget({
    Key? key,
    required this.question,
    required this.onChange,
  }) : super(key: key);

  @override
  _QuizWidgetState createState() => _QuizWidgetState();
}

class _QuizWidgetState extends State<QuizWidget> {
  late String _titleSelected = '';

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 40),
      child: Column(
        children: [
          Text(
            widget.question.title,
            style: AppTextStyles.heading,
          ),
          SizedBox(height: 24),
          ...widget.question.answers.map(
            (question) => AnswerWidget(
              answer: question,
              disabled: _titleSelected.isNotEmpty,
              isSelected: _titleSelected == question.title,
              onTap: () {
                setState(() {
                  _titleSelected = question.title;
                });
                Future.delayed(Duration(milliseconds: 500)).then(
                  (value) => widget.onChange(),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
