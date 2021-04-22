import 'package:flutter/foundation.dart';

import 'home_repository.dart';
import 'home_state.dart';
import '../../shared/models/quiz_model.dart';
import '../../shared/models/user_model.dart';

class HomeController {
  final stateNotifier = ValueNotifier(HomeState.empty);
  set state(HomeState state) => stateNotifier.value = state;
  HomeState get state => stateNotifier.value;

  final repository = HomeRepository();

  UserModel? user;
  List<QuizModel>? quizzes;

  void getUser() async {
    state = HomeState.loaging;
    user = await repository.getUser();
    state = HomeState.success;
  }

  void getQuizzes() async {
    state = HomeState.loaging;
    quizzes = await repository.getQuizzes();
    state = HomeState.success;
  }
}
