import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../../core/core.dart';

final config = {
  'Fácil': {
    'color': AppColors.levelButtonFacil,
    'borderColor': AppColors.levelButtonBorderFacil,
    'fontColor': AppColors.levelButtonTextFacil
  },
  'Médio': {
    'color': AppColors.levelButtonMedio,
    'borderColor': AppColors.levelButtonBorderMedio,
    'fontColor': AppColors.levelButtonTextMedio
  },
  'Difícil': {
    'color': AppColors.levelButtonDificil,
    'borderColor': AppColors.levelButtonBorderDificil,
    'fontColor': AppColors.levelButtonTextDificil
  },
  'Perito': {
    'color': AppColors.levelButtonPerito,
    'borderColor': AppColors.levelButtonBorderPerito,
    'fontColor': AppColors.levelButtonTextPerito
  },
};

class LevelButtonWidget extends StatelessWidget {
  final String label;
  const LevelButtonWidget({
    Key? key,
    required this.label,
  })  : assert(label == 'Fácil' ||
            label == 'Médio' ||
            label == 'Difícil' ||
            label == 'Perito'),
        super(key: key);

  Color get color => config[label]!['color']!;
  Color get borderColor => config[label]!['borderColor']!;
  Color get fontColor => config[label]!['fontColor']!;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 10),
      decoration: BoxDecoration(
        color: color,
        border: Border.fromBorderSide(
          BorderSide(color: borderColor),
        ),
        borderRadius: BorderRadius.circular(28),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 26,
          vertical: 6,
        ),
        child: Text(
          label,
          style: GoogleFonts.notoSans(
            color: fontColor,
            fontSize: 13,
          ),
        ),
      ),
    );
  }
}
