import 'package:bloc_test/bloc/notice_bloc.dart';
import 'package:bloc_test/bloc/count_bloc.dart';
import 'package:bloc_test/event/notice_event.dart';
import 'package:bloc_test/event/count_event.dart';
import 'package:bloc_test/state/count_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'homework.dart';

class TempPage extends StatelessWidget {
  const TempPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CounterBlocs, CounterStates>(
      builder: (context, state) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              state.counter.toString(),
              style: TextStyle(fontSize: 24),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () =>
                      BlocProvider.of<CounterBlocs>(context).add(Increment()),
                  child: Icon(Icons.add),
                ),
                ElevatedButton(
                  onPressed: () =>
                      BlocProvider.of<CounterBlocs>(context).add(Decrement()),
                  child: Icon(Icons.remove),
                ),
                ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => HomeWidget(),
                          ));
                    },
                    child: Icon(Icons.refresh)),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: TextField(
                onChanged: (value) {
                  BlocProvider.of<NoticeBlocs>(context).add(Add(value));
                },
                decoration: InputDecoration(
                  labelText: 'input',
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
