import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:quiz_test/src/core/navigation/navigation_path.dart';
import 'package:quiz_test/src/features/main/presentation/main_page.dart';

GoRouter createRouter() {
  return GoRouter(
    initialLocation: NavigationPath.mainPage.getRoute(),
    debugLogDiagnostics: true,
    routes: [
      GoRoute(
          path: NavigationPath.mainPage.getRoute(),
          pageBuilder: (context, state) {
            return MaterialPage(
              key: state.pageKey,
              name: NavigationPath.mainPage.getRoute(),
              child: const MainPage(),
            );
          },
          routes: []),
    ],
  );
}
