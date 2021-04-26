import 'package:flutter/material.dart';

import 'src/pages/result/result_page.dart';
import 'src/pages/challenge/challenge_page.dart';
import 'src/pages/home/home_page.dart';
import 'src/pages/splash/splash_page.dart';

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "DevQuiz",
      debugShowCheckedModeBanner: false,
      initialRoute: 'SPLASH_PAGE',
      routes: {
        'HOME_PAGE': (_) => HomePage(),
        'CHALLENGE_PAGE': (_) => ChallengePage(),
        'SPLASH_PAGE': (_) => SplashPage(),
        'RESULT_PAGE': (_) => ResultPage(),
      },
    );
  }
}
