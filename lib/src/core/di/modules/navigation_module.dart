import 'package:go_router/go_router.dart';
import 'package:injectable/injectable.dart';
import 'package:quiz_test/src/core/navigation/router.dart';

@module
abstract class NavigationModule {
  @singleton
  GoRouter get router => createRouter();
}
