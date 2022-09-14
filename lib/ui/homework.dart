import 'package:bloc_test/bloc/homework_bloc.dart';
import 'package:bloc_test/bloc/notice_bloc.dart';
import 'package:bloc_test/state/notice_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../state/homework_state.dart';

final List<int> colorIndex = [300, 400, 500, 600, 700, 800];

class HomeWork extends StatefulWidget {
  const HomeWork({Key? key}) : super(key: key);

  @override
  State<HomeWork> createState() => _HomeWorkState();
}

class _HomeWorkState extends State<HomeWork> {
  @override
  Widget build(BuildContext context) {
    double mediaQueryHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        title: Text('Page2'),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: BlocBuilder<NoticeBlocs, NoticeStates>(
        builder: (context, state) => Padding(
          padding: EdgeInsets.all(MediaQuery.of(context).size.width * 0.03),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: MediaQuery.of(context).size.height * 0.4,
                width: MediaQuery.of(context).size.width,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '숙제진도표',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    Divider(
                      height: MediaQuery.of(context).size.width * 0.03,
                      color: Colors.grey,
                    ),
                    Text(
                      '12월 11일 금요일',
                      style: TextStyle(
                          fontSize: 16, fontWeight: FontWeight.normal),
                    ),
                    Divider(
                      height: MediaQuery.of(context).size.width * 0.06,
                      color: Colors.transparent,
                    ),
                    Text(
                      '공지사항',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    Divider(
                      height: MediaQuery.of(context).size.width * 0.03,
                      color: Colors.grey,
                    ),
                    Text(state.notice)
                  ],
                ),
              ),
              Text(
                'Daily Check',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              Expanded(
                flex: 1,
                child: SizedBox(
                  child: TaskListWidget(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class TaskListWidget extends StatefulWidget {
  const TaskListWidget({Key? key}) : super(key: key);

  @override
  State<TaskListWidget> createState() => _TaskListWidgetState();
}

class _TaskListWidgetState extends State<TaskListWidget> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeWorkBlocs, HomeWorkState>(
      builder: (context, state) => ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: state.homeWorkList.length,
        itemBuilder: (context, index) {
          return TaskTileWidget(
            index: index,
          );
        },
        separatorBuilder: (context, index) {
          return VerticalDivider(
            width: MediaQuery.of(context).size.width * 0.02,
            color: Colors.grey[400],
            thickness: 1.0,
            indent: 10.0,
            endIndent: 10.0,
          );
        },
      ),
    );
  }
}

class TaskTileWidget extends StatefulWidget {
  final int index;

  const TaskTileWidget({Key? key, required this.index}) : super(key: key);

  @override
  State<TaskTileWidget> createState() => _TaskTileWidgetState();
}

class _TaskTileWidgetState extends State<TaskTileWidget> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.4,
      child: Card(
        color: Colors.red[colorIndex[widget.index]],
        elevation: 8.0,
        child: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '${context.read<HomeWorkBlocs>().state.homeWorkList[widget.index].book}',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            Text(
              '${context.read<HomeWorkBlocs>().state.homeWorkList[widget.index].startPage}~'
              '${context.read<HomeWorkBlocs>().state.homeWorkList[widget.index].endPage}',
              style: TextStyle(fontSize: 16),
            ),
          ],
        )),
      ),
    );
  }
}
