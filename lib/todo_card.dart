import 'package:flutter/material.dart';
import 'package:flutter_todo_app/My_Home_page.dart';
import 'package:flutter_todo_app/todo_model.dart';
class TodoCardWidget extends StatelessWidget {
  final TodoModel todoModel;
  final Function(String,bool) update;
  const TodoCardWidget({super.key,required this.todoModel, required this.update});

  @override
  Widget build(BuildContext context) {
    return Card(
        child: ListTile(
          leading: Checkbox(
            onChanged: (value) {
              update(todoModel.id,value!);
              print(value);
            },
            value: todoModel.status,
          ),
          title:  Text(todoModel.taskName),
          subtitle: Text(
            todoModel.dueDate,
            style: const TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
          ),
          trailing: Text(
            todoModel.type,
            style: TextStyle(color: todoTypeColor(todoModel.type), fontWeight: FontWeight.bold),
          ),
        ));
  }
}
Color todoTypeColor(String value){
  switch(value){
    case "Shopping":
      return Colors.amber;
      break;
    case "Work":
      return Colors.blue;
      break;
    case "Personal":
      return Colors.red;
      break;
    case "Wishlist":
      return Colors.orange;
      break;
    default:
      return Colors.black;

  }
}