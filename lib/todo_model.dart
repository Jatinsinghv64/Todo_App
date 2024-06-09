class TodoModel {
  final String id;
  final String taskName;
  final String dueDate;
  final String type;
   bool status;
  TodoModel(
      {required this.dueDate,
      required this.status,
        required this.id,
      required this.taskName,
      required this.type});
}
