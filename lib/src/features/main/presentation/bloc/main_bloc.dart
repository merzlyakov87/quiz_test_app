import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:quiz_test/src/features/main/data/model/quiz_category.dart';
import 'package:quiz_test/src/features/main/data/model/quiz_difficulty.dart';

part 'main_bloc.freezed.dart';
part 'main_event.dart';
part 'main_state.dart';

@injectable
class MainBloc extends Bloc<MainEvent, MainState> {
  MainBloc() : super(const MainState.initial()) {
    on<MainStartEvent>((event, emit) => emit(MainState.start(
        category: event.category,
        difficulty: event.difficulty,
        dateTime: DateTime.now())));
  }
}
