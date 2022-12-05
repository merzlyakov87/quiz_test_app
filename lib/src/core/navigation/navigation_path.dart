enum NavigationPath { mainPage, quizPage, resultPage }

extension NavigationPathExt on NavigationPath {
  String getRoute() {
    switch (this) {
      case NavigationPath.mainPage:
        return '/';
      case NavigationPath.quizPage:
        return 'quiz';
      case NavigationPath.resultPage:
        return 'result';
    }
  }
}
