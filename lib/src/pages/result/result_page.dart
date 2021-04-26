import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';

import '../../../core/app_text_styles.dart';
import '../../../core/core.dart';
import '../../shared/models/result_model.dart';
import '../challenge/widgets/next_button/next_button_widget.dart';

class ResultPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final ResultModel result =
        ModalRoute.of(context)!.settings.arguments as ResultModel;

    return Scaffold(
      body: Container(
        padding: const EdgeInsets.only(right: 68, left: 68, top: 100),
        width: double.maxFinite,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(AppImages.trophy),
            Column(
              children: [
                Text(
                  'Parabéns!',
                  style: AppTextStyles.heading40,
                ),
                SizedBox(height: 16),
                Text.rich(
                  TextSpan(
                    style: AppTextStyles.body,
                    children: [
                      TextSpan(text: 'Você concluiu'),
                      TextSpan(
                        text: '\n${result.title} ',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      TextSpan(
                          text:
                              '\ncom ${result.numberOfRightAnswers} de ${result.numberOfQuestions} acertos'),
                    ],
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 64),
                Container(
                  width: double.maxFinite,
                  child: NextButtonWidget.purple(
                    label: 'Compartilhar',
                    onTap: () {
                      Share.share('text');
                    },
                  ),
                ),
                SizedBox(height: 24),
                Container(
                  width: double.maxFinite,
                  child: NextButtonWidget.white(
                    label: 'Voltar ao início',
                    onTap: () {
                      Navigator.pushReplacementNamed(context, 'HOME_PAGE');
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
