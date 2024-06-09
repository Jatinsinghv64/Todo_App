import 'package:flutter/material.dart';
import 'package:flutter_todo_app/todo_card.dart';
import 'package:flutter_todo_app/todo_model.dart';

import 'data.dart';
import 'new_taskpage.dart';

class MyHomePage extends StatefulWidget {
  // final TodoModel todoModel;
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String category = "Pending";
  updateStatus(String id, bool status) async {
    int index = ListOfTodo.indexWhere((element) => element.id == id);
    ListOfTodo[index].status = status;
    setState(() {});
    await Future.delayed(const Duration(milliseconds: 500));
    if (category == "All List") {
      tempListOfTodo = ListOfTodo.toList();
    } else if (category == "PersonalWork") {
      tempListOfTodo =
          ListOfTodo.where((element) => element.type == "Work").toList();
    } else if (category == "Finished") {
      tempListOfTodo =
          ListOfTodo.where((element) => element.status == true).toList();
    } else if (category == "Shopping") {
      tempListOfTodo =
          ListOfTodo.where((element) => element.type == "Shopping").toList();
    } else if (category == "Pending") {
      tempListOfTodo =
          ListOfTodo.where((element) => element.status == false).toList();
    } else if (category == "Wishlist") {
      tempListOfTodo =
          ListOfTodo.where((element) => element.type == "Wishlist").toList();
    }
    setState(() {});
  }

  void addTodo(TodoModel todoModel) {
    ListOfTodo.add(todoModel);
    if (category == "All List" || category == "Pending"|| category==todoModel.type) {
      tempListOfTodo.add(todoModel);
    }
    setState(() {});
  }

  List<TodoModel> ListOfTodo = [];
  List<TodoModel> tempListOfTodo = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (child) => NewTaskPage(
                        addTodo: addTodo,
                      )));
        },
        child: Icon(Icons.add),
      ),
      appBar: AppBar(
        title: Text("TODO: $category"),
        centerTitle: true,
        actions: [
          PopupMenuButton(
            onSelected: (value) {
              category = value;
              if (category == "All List") {
                tempListOfTodo = ListOfTodo.toList();
              } else if (category == "PersonalWork") {
                tempListOfTodo =
                    ListOfTodo.where((element) => element.type == "Work")
                        .toList();
              } else if (category == "Finished") {
                tempListOfTodo =
                    ListOfTodo.where((element) => element.status == true)
                        .toList();
              } else if (category == "Shopping") {
                tempListOfTodo =
                    ListOfTodo.where((element) => element.type == "Shopping")
                        .toList();
              } else if (category == "Pending") {
                tempListOfTodo =
                    ListOfTodo.where((element) => element.status == false)
                        .toList();
              } else if (category == "Wishlist") {
                tempListOfTodo =
                    ListOfTodo.where((element) => element.type == "Wishlist")
                        .toList();
              }

              setState(() {});
            },
            itemBuilder: (context) => popMenuItemTitleList
                .map(
                  (e) => PopupMenuItem(
                    value: e,
                    child: Text(
                      e,
                    ),
                  ),
                )
                .toList(),
          ),
        ],
      ),
      body: ListView(
        children: tempListOfTodo
            .map(
              (e) => TodoCardWidget(todoModel: e, update: updateStatus),
            )
            .toList(),
      ),
    );
  }
}
