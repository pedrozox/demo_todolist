class TaskEntity {
  final String id;
  final String title;
  final String description;
  bool isDone;

  TaskEntity({
    required this.id,
    required this.title,
    required this.description,
    this.isDone = false,
  });
}
