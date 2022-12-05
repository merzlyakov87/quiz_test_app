part of 'main_bloc.dart';

@freezed
class MainEvent with _$MainEvent {
  const factory MainEvent.initial() = MainInitialEvent;
  const factory MainEvent.start(
      {required QuizCategory category,
      required QuizDifficulty difficulty}) = MainStartEvent;
}
