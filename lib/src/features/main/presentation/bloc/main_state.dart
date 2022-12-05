part of 'main_bloc.dart';

@freezed
class MainState with _$MainState {
  const factory MainState.initial() = _MainInitialState;
  const factory MainState.start(
      {required QuizCategory category,
      required QuizDifficulty difficulty,
      required DateTime dateTime}) = _MainStartState;
}
