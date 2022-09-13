import '../model/homework_model.dart';

class HomeWorkState {
  List<HomeWorkModel> homeWorkList;

  HomeWorkState({required this.homeWorkList});
}

class InitialState extends HomeWorkState {
  InitialState() : super(homeWorkList: HomeWorkExample);
}

List<HomeWorkModel> initHomeWorkModel = [
  HomeWorkModel('book1', 0, 0),
  HomeWorkModel('book2', 0, 0),
  HomeWorkModel('book3', 0, 0)
];

List<HomeWorkModel> HomeWorkExample = [
  HomeWorkModel('book1', 10, 14),
  HomeWorkModel('book2', 15, 18),
  HomeWorkModel('book3', 19, 22),
  HomeWorkModel('book4', 23, 26),
  HomeWorkModel('book5', 27, 31),
];