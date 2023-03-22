import 'dart:async';

import 'package:bloc/bloc.dart';

import 'new_player_timer_state.dart';

class NewPlayerTimerCubit extends Cubit<NewPlayerTimerState<Duration>> {
  NewPlayerTimerCubit() : super(TimerInitial());
  StreamSubscription<int>? _timerSubscription;

  Stream<int> tick({required int ticks}) {
    return Stream<int>.periodic(
        Duration(seconds: 1), (count) => ticks - count - 1).take(ticks);
  }

  void onStarted({required Duration duration}) {
    /// In case of there is an subscription exists, we have to cancel it
    _timerSubscription?.cancel();

    /// triggers the TimerRunInProgress state
    emit(TimerRunInProgress(timer: duration));
  }

  @override
  Future<void> close() {
    _timerSubscription?.cancel();
    return super.close();
  }
}
