import 'package:flutter/material.dart';

import '../../../../shared/models/answer_model.dart';
import '../../../../../core/app_text_styles.dart';
import '../../../../../core/app_colors.dart';

class AnswerWidget extends StatelessWidget {
  final AnswerModel answer;
  final bool isSelected;
  final bool disabled;
  final VoidCallback onTap;

  const AnswerWidget({
    Key? key,
    required this.answer,
    required this.onTap,
    this.disabled = false,
    this.isSelected = false,
  }) : super(key: key);

  Color get _selectedColorRight =>
      answer.isRight ? AppColors.darkGreen : AppColors.darkRed;

  Color get _selectedBorderRight =>
      answer.isRight ? AppColors.lightGreen : AppColors.lightRed;

  Color get _selectedColorCardRight =>
      answer.isRight ? AppColors.lightGreen : AppColors.lightRed;

  Color get _selectedBorderCardRight =>
      answer.isRight ? AppColors.green : AppColors.red;

  TextStyle get _selectedTextStyleRight =>
      answer.isRight ? AppTextStyles.bodyDarkGreen : AppTextStyles.bodyDarkRed;

  IconData get _selectedIconRight => answer.isRight ? Icons.check : Icons.close;

  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
      ignoring: disabled,
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: isSelected ? _selectedColorCardRight : AppColors.white,
            borderRadius: BorderRadius.circular(10),
            border: Border.fromBorderSide(BorderSide(
              color: isSelected ? _selectedBorderCardRight : AppColors.border,
            )),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(
                  answer.title,
                  style:
                      isSelected ? _selectedTextStyleRight : AppTextStyles.body,
                  softWrap: true,
                ),
              ),
              Container(
                margin: const EdgeInsets.only(left: 20),
                height: 24,
                width: 24,
                decoration: BoxDecoration(
                  color: isSelected ? _selectedColorRight : AppColors.white,
                  borderRadius: BorderRadius.circular(500),
                  border: Border.fromBorderSide(
                    BorderSide(
                      color:
                          isSelected ? _selectedBorderRight : AppColors.border,
                    ),
                  ),
                ),
                child: isSelected
                    ? Icon(
                        _selectedIconRight,
                        color: AppColors.white,
                        size: 16,
                      )
                    : null,
              )
            ],
          ),
        ),
      ),
    );
  }
}
