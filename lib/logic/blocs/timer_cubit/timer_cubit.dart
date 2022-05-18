import 'dart:async';

import 'package:bloc/bloc.dart';

part 'timer_state.dart';

class TimerCubit extends Cubit<TimerState> {
  late StreamSubscription<int> subscription;
  late Stream<int> timeStream = Stream.periodic(const Duration(seconds: 1),
      (i) => state.duration > 0 ? --state.duration : state.duration);
  late String time = '01:00';

  TimerCubit() : super(TimerStarted(60)) {
    listenToStream();
  }

  StreamSubscription<int> listenToStream() {
    return subscription = timeStream.listen((second) {
      time = '0${state.duration ~/ 60} : ${state.duration % 60}';
      if (state is TimerResumed || state is TimerStarted) {
        play();
      } else if (state is TimerPaused) {
        pause();
      } else if (state is TimerRestarted) {
        restart();
      }
    });
  }

  void play() {
    subscription.resume();
    emit(TimerResumed(state.duration));
  }

  void pause() {
    subscription.pause();
    emit(TimerPaused(state.duration));
  }

  void restart() {
    time = '01:00';
    emit(TimerStarted(60));
  }
}
