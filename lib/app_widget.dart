import 'package:flutter/material.dart';

import 'src/pages/challenge/challenge_page.dart';
// import 'src/pages/home/home_page.dart';
// import 'src/pages/splash/splash_page.dart';

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "DevQuiz",
      debugShowCheckedModeBanner: false,
      home: ChallengePage(),
    );
  }
}
