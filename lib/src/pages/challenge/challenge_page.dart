import 'package:dev_quiz/src/pages/challenge/challenge_controller.dart';
import 'package:dev_quiz/src/shared/models/question_model.dart';
import 'package:flutter/material.dart';

import 'widgets/next_button/next_button_widget.dart';
import 'widgets/question_indicator/question_indicator_widget.dart';
import 'widgets/quiz/quiz_widget.dart';

class ChallengePage extends StatefulWidget {
  @override
  _ChallengePageState createState() => _ChallengePageState();
}

class _ChallengePageState extends State<ChallengePage> {
  final controller = ChallengeController();
  final pageController = PageController();

  @override
  void initState() {
    pageController.addListener(() {
      controller.currentPage = pageController.page!.toInt();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final List<QuestionModel> questions =
        ModalRoute.of(context)!.settings.arguments as List<QuestionModel>;

    void _nextPage() {
      if (controller.currentPage < questions.length) {
        pageController.nextPage(
          duration: Duration(milliseconds: 200),
          curve: Curves.linear,
        );
      }
    }

    return Scaffold(
      appBar: PreferredSize(
        child: SafeArea(
          top: true,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              BackButton(),
              ValueListenableBuilder<int>(
                valueListenable: controller.currentPageNotifier,
                builder: (context, value, _) => QuestionIndicatorWidget(
                  currentPage: value + 1,
                  length: questions.length,
                ),
              ),
            ],
          ),
        ),
        preferredSize: Size.fromHeight(126),
      ),
      body: PageView(
        controller: pageController,
        physics: NeverScrollableScrollPhysics(),
        children: [
          ...questions.map(
            (question) => QuizWidget(
              question: question,
              onChange: _nextPage,
            ),
          ),
        ],
      ),
      bottomNavigationBar: SafeArea(
        bottom: true,
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 20,
          ),
          child: ValueListenableBuilder<int>(
            valueListenable: controller.currentPageNotifier,
            builder: (context, value, _) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  if (value + 1 < questions.length)
                    Expanded(
                      child: NextButtonWidget.white(
                        label: 'Pular',
                        onTap: _nextPage,
                      ),
                    ),
                  if (value + 1 == questions.length)
                    Expanded(
                      child: NextButtonWidget.green(
                        label: 'Confirmar',
                        onTap: () {
                          Navigator.pushNamed(context, 'HOME');
                        },
                      ),
                    ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
