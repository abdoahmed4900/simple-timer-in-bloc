part of 'timer_cubit.dart';

abstract class TimerState {
  int duration = 60;
  TimerState(this.duration);
}

class TimerStarted extends TimerState {
  TimerStarted(int duration) : super(duration);
}

class TimerPaused extends TimerState {
  TimerPaused(int duration) : super(duration);
}

class TimerResumed extends TimerState {
  TimerResumed(int duration) : super(duration);
}

class TimerOver extends TimerState {
  TimerOver({int duration = 0}) : super(duration);
}

class TimerRestarted extends TimerState {
  TimerRestarted(int duration) : super(duration);
}
