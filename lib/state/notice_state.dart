class NoticeStates {
  String notice;

  NoticeStates({required this.notice});
}

class InitialState extends NoticeStates {
  InitialState() : super(notice: '공지사항이 없습니다');
}
