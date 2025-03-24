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

  static TaskEntity fromJson(data) {
    return TaskEntity(
      id: data['id'],
      title: data['title'],
      description: data['description'],
      isDone: data['isDone'],
    );
  }

  Map<String, Object> toJson() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'isDone': isDone,
    };
  }
}
