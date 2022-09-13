import 'package:bloc_test/state/homework_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../event/homework_event.dart';

class HomeWorkBlocs extends Bloc<HomeWorkEvents, HomeWorkState> {
  HomeWorkBlocs() : super(InitialState()) {
    on<AddHomeWork>(
            (event, emit) => emit(HomeWorkState(homeWorkList: event.addHomeWork)));
  }
}