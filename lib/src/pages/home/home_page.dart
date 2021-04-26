import 'package:flutter/material.dart';

import '../../../core/core.dart';
import 'home_controller.dart';
import 'home_state.dart';
import 'widgets/quiz_card/quiz_card_widget.dart';
import 'widgets/level_button/level_button_widget.dart';
import 'widgets/app_bar/app_bar_widget.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final controller = HomeController();

  @override
  void initState() {
    super.initState();
    controller.getUser();
    controller.getQuizzes();
    controller.stateNotifier.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    if (controller.state == HomeState.loaging) {
      return Container(
        color: AppColors.white,
        child: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }

    return Scaffold(
      appBar: AppBarWidget(user: controller.user!),
      body: Column(
        children: [
          SizedBox(height: 24),
          Container(
            height: 33,
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              children: [
                LevelButtonWidget(label: 'Fácil'),
                LevelButtonWidget(label: 'Médio'),
                LevelButtonWidget(label: 'Difícil'),
                LevelButtonWidget(label: 'Perito'),
              ],
            ),
          ),
          SizedBox(height: 24),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: GridView.count(
              shrinkWrap: true,
              crossAxisCount: 2,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              children: controller.quizzes!
                  .map(
                    (e) => QuizCardWidget(
                      title: e.title,
                      percent: e.questionAnswered / e.questions.length,
                      completed: '${e.questionAnswered}/${e.questions.length}',
                      onTap: () {
                        Navigator.pushNamed(
                          context,
                          'CHALLENGE_PAGE',
                          arguments: e,
                        );
                      },
                    ),
                  )
                  .toList(),
            ),
          )
        ],
      ),
    );
  }
}
