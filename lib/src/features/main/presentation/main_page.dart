import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:quiz_test/src/core/di/injection.dart';
import 'package:quiz_test/src/core/navigation/navigation_path.dart';
import 'package:quiz_test/src/features/main/presentation/bloc/main_bloc.dart';
import 'package:quiz_test/src/features/main/presentation/widgets/main_menu.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
          create: (context) => getIt<MainBloc>(),
          child: BlocConsumer<MainBloc, MainState>(
            listener: (context, state) {
              state.when(
                  initial: () {},
                  start: (category, difficulty, dateTime) {
                    context.go(
                        '/${NavigationPath.quizPage.getRoute()}/?category=${category.name}&difficulty=${difficulty.name}');
                  });
            },
            buildWhen: (previous, current) => current.map<bool>(
                initial: (value) => true, start: ((value) => false)),
            builder: ((context, state) {
              return state.when(
                initial: () => MainMenu(
                  onTap: (category, difficulty) {
                    context.read<MainBloc>().add(MainEvent.start(
                          category: category,
                          difficulty: difficulty,
                        ));
                  },
                ),
                start: (category, difficulty, dateTime) {
                  throw UnimplementedError();
                },
              );
            }),
          )),
    );
  }
}
