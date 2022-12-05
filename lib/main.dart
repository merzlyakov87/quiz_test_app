import 'package:flutter/material.dart';
import 'package:quiz_test/src/app.dart';
import 'package:quiz_test/src/core/di/injection.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await configureDependencies();
  runApp(QuizApp(router: getIt()));
}
