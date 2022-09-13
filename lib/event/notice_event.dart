import '../model/homework_model.dart';

abstract class NoticeEvents {}

class Add extends NoticeEvents {
  String data;

  Add(this.data);
}
