import 'package:flutter/material.dart';

import '../../../../../core/core.dart';
import '../../../../shared/widgets/progress_indicator_widget.dart';

class QuestionIndicatorWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Questão 04',
                style: AppTextStyles.body,
              ),
              Text(
                'de 10',
                style: AppTextStyles.body,
              ),
            ],
          ),
          SizedBox(height: 16),
          ProgressIndicatorWidget(
            value: 0.8,
          )
        ],
      ),
    );
  }
}
