class ToDo {
  const ToDo({
    this.userId,
    this.id,
    this.title,
    this.completed,
  });

  final int? userId;
  final int? id;
  final String? title;
  final bool? completed;

  factory ToDo.fromJson(Map<String, dynamic> json) {
    return ToDo(
      userId: json["userId"],
      id: json["id"],
      title: json["title"],
      completed: json["completed"],
    );
  }
}
