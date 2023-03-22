import 'package:freezed_annotation/freezed_annotation.dart';

part 'new_player_timer_state.freezed.dart';

@freezed
class NewPlayerTimerState<T> with _$NewPlayerTimerState<T> {
  const factory NewPlayerTimerState.timerInitial() = TimerInitial<T>;

  const factory NewPlayerTimerState.timerRunInProgress({required T timer}) =
      TimerRunInProgress<T>;

  factory NewPlayerTimerState.timerRunComplete() = TimerRunComplete<T>;
}
