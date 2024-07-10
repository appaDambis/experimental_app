class TodoModel {
  final String id;
  final String name;
  final bool isCompleted;

  TodoModel({required this.id, required this.name, this.isCompleted = false});
}
