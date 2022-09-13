import 'package:bloc_test/event/notice_event.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../state/notice_state.dart';

class NoticeBlocs extends Bloc<NoticeEvents, NoticeStates> {
  NoticeBlocs() : super(InitialState()) {
    on<Add>(
            (event, emit) => emit(NoticeStates(notice: event.data)));
    }
}
