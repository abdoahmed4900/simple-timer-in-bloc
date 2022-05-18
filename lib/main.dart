import 'package:bloc_timer/logic/blocs/timer_cubit/timer_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<TimerCubit>(
      create: (context) => TimerCubit(),
      child: MaterialApp(
        title: 'Timer',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const MyHomePage(title: 'Timer'),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              BlocBuilder<TimerCubit, TimerState>(
                builder: (context, state) {
                  return Text(BlocProvider.of<TimerCubit>(context).time);
                },
              ),
              BlocBuilder<TimerCubit, TimerState>(
                builder: (context, state) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                          onPressed: () {
                            if (state is TimerStarted ||
                                state is TimerResumed) {
                              BlocProvider.of<TimerCubit>(context).pause();
                            } else if (state is TimerPaused) {
                              BlocProvider.of<TimerCubit>(context).play();
                            }
                          },
                          icon: BlocProvider.of<TimerCubit>(context)
                                  .subscription
                                  .isPaused
                              ? const Icon(Icons.play_arrow)
                              : const Icon(Icons.pause)),
                      IconButton(
                          onPressed: () {
                            BlocProvider.of<TimerCubit>(context).restart();
                          },
                          icon: const Icon(Icons.replay)),
                    ],
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
