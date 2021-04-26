import 'package:flutter/material.dart';

import 'challenge_controller.dart';
import 'widgets/next_button/next_button_widget.dart';
import 'widgets/question_indicator/question_indicator_widget.dart';
import 'widgets/quiz/quiz_widget.dart';
import '../../shared/models/quiz_model.dart';
import '../../shared/models/result_model.dart';

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
    final QuizModel quiz =
        ModalRoute.of(context)!.settings.arguments as QuizModel;

    void _nextPage() {
      if ((controller.currentPage + 1) < quiz.questions.length) {
        pageController.nextPage(
          duration: Duration(milliseconds: 200),
          curve: Curves.linear,
        );
      }
    }

    void _onSelected(bool value) {
      if (value) {
        controller.rightAnswers++;
      }
      _nextPage();
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
                  length: quiz.questions.length,
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
          ...quiz.questions.map(
            (question) => QuizWidget(
              question: question,
              onSelected: _onSelected,
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
                  if (value + 1 < quiz.questions.length)
                    Expanded(
                      child: NextButtonWidget.white(
                        label: 'Pular',
                        onTap: _nextPage,
                      ),
                    ),
                  if (value + 1 == quiz.questions.length)
                    Expanded(
                      child: NextButtonWidget.green(
                        label: 'Confirmar',
                        onTap: () {
                          Navigator.pushNamed(
                            context,
                            'RESULT_PAGE',
                            arguments: ResultModel(
                              title: quiz.title,
                              numberOfQuestions: quiz.questions.length,
                              numberOfRightAnswers: controller.rightAnswers,
                            ),
                          );
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
