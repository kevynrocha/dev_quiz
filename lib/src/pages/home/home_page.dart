import 'package:DevQuiz/src/pages/home/widgets/quiz_card/quiz_card_widget.dart';
import 'package:flutter/material.dart';

import 'widgets/level_button/level_button_widget.dart';
import 'widgets/app_bar/app_bar_widget.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(),
      body: Column(
        children: [
          SizedBox(height: 24),
          Container(
            //TODO REMOVER CONTAINER E ALTURA FIXA
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
              children: [
                QuizCardWidget(),
                QuizCardWidget(),
                QuizCardWidget(),
              ],
            ),
          )
        ],
      ),
    );
  }
}
