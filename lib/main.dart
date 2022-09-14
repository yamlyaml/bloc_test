import 'package:bloc_test/bloc/homework_bloc.dart';
import 'package:bloc_test/bloc/notice_bloc.dart';
import 'package:bloc_test/bloc/count_bloc.dart';
import 'package:bloc_test/ui/count.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<CounterBlocs>(
            create: (BuildContext context) => CounterBlocs()),
        BlocProvider<NoticeBlocs>(
            create: (BuildContext context) => NoticeBlocs()),
        BlocProvider<HomeWorkBlocs>(
            create: (BuildContext context) => HomeWorkBlocs()),
      ],
      child: MaterialApp(
        title: 'hello',
        home: Scaffold(
          appBar: AppBar(
            title: Text('Page1'),
            centerTitle: true,
          ),
          body: CountPage(),
        ),
      ),
    );
  }
}
