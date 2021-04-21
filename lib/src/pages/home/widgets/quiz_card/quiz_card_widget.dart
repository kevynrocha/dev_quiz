import 'package:DevQuiz/core/app_images.dart';
import 'package:DevQuiz/core/app_text_styles.dart';
import 'package:DevQuiz/src/shared/widgets/progress_indicator_widget.dart';
import 'package:flutter/material.dart';

import '../../../../../core/app_colors.dart';

class QuizCardWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        border: Border.fromBorderSide(
          BorderSide(color: AppColors.border),
        ),
        color: AppColors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 40,
            width: 40,
            child: Image.asset(AppImages.blocks),
          ),
          SizedBox(height: 20),
          Text(
            'Gerenciamento de estado',
            style: AppTextStyles.heading15,
          ),
          SizedBox(height: 20),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 10),
                child: Text(
                  '3/10',
                  style: AppTextStyles.body11,
                ),
              ),
              Expanded(
                child: ProgressIndicatorWidget(value: 0.3),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
