class Todo {
  String title; // 할일 이름
  bool isDone; // 완료 여부

  Todo({
    required this.title,
    this.isDone = false,
});
}