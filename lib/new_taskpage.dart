import 'package:flutter/material.dart';
import 'package:flutter_todo_app/todo_model.dart';

class NewTaskPage extends StatefulWidget {
  final Function(TodoModel) addTodo;
  NewTaskPage({
    super.key,
    required this.addTodo,
  });

  @override
  State<NewTaskPage> createState() => _NewTaskPageState();
}

class _NewTaskPageState extends State<NewTaskPage> {
  TextEditingController taskController = TextEditingController();
  TextEditingController dueDate = TextEditingController();
  String dropDownValue = "Work";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Assign A New Task"),
        centerTitle: true,
      ),
      body: Padding(
        padding:
            const EdgeInsets.only(bottom: 20, left: 20, right: 20, top: 20),
        child: Column(
          children: [
            const Align(
              alignment: Alignment.bottomLeft,
              child: Text("What is to be Done",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  )),
            ),
            TextField(
              controller: taskController,
              decoration: const InputDecoration(
                hintText: "Enter Your Task",
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            const Align(
              alignment: Alignment.bottomLeft,
              child: Text("Pick Due Date",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  )),
            ),
            Row(
              children: [
                SizedBox(
                  width: 250,
                  child: TextField(
                    controller: dueDate,
                    decoration:
                        const InputDecoration(hintText: "Choose Due Date"),
                  ),
                ),
                IconButton(
                  onPressed: () async {
                    DateTime? date = await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(2000),
                        lastDate: DateTime(2050));
                    dueDate.text = date.toString().substring(0, 10);
                    // print(date);
                  },
                  icon: const Icon(Icons.calendar_month),
                ),
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            const Align(
              alignment: Alignment.bottomLeft,
              child: Text(
                "Add To List",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
            ),
            DropdownButton(
              isExpanded: true,
              value: dropDownValue,
              items: [
                DropdownMenuItem(
                  value: "Work",
                  child: const Text("Work"),
                ),
                DropdownMenuItem(
                  value: "Personal",
                  child: const Text("Personal"),
                ),
                DropdownMenuItem(
                  value: "Shopping",
                  child: const Text("Shopping"),
                ),
                DropdownMenuItem(
                  value: "Wishlist",
                  child: const Text("Wishlist"),
                ),
              ],
              onChanged: (value) {
                dropDownValue = value!;
                setState(() {});
              },
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          widget.addTodo(TodoModel(
            id: DateTime.now().toString(),
              dueDate: dueDate.text,
              status: false,
              taskName: taskController.text,
              type: dropDownValue));
          Navigator.pop(context);
        },
        child: const Icon(
          Icons.check,
        ),
      ),
    );
  }
}
