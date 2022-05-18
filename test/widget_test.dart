// ignore: unused_import
import 'package:bloc_test/bloc_test.dart';
import 'package:bloc_timer/logic/blocs/timer_cubit/timer_cubit.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('test timer cubit', () {
    late TimerCubit cubit;
    setUp(() {
      cubit = TimerCubit();
    });

    tearDown(() {
      cubit.close();
    });
  });
}
