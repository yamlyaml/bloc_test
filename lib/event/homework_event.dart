import '../model/homework_model.dart';

abstract class HomeWorkEvents {}

class AddHomeWork extends HomeWorkEvents {
  List<HomeWorkModel> addHomeWork;

  AddHomeWork(this.addHomeWork);
}
