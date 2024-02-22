import 'package:flutter/material.dart';
import 'package:flutter_application_1/classes/todo_class.dart';

class TodoItems extends StatefulWidget {
  const TodoItems({
    super.key,
    required this.todos,
  });

  final List<Todo> todos;

  @override
  State<TodoItems> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<TodoItems> {
  TextEditingController _taskController = TextEditingController();
  void onDelete(index) {
    setState(() {
      widget.todos.removeAt(index);
    });
  }

  void onComplete(index) {
    setState(() {
      bool prev = widget.todos.elementAt(index).isCompleted;
      widget.todos.elementAt(index).isCompleted = !prev;
    });
  }

  void onEdit(index) {
    if (_taskController.text.isNotEmpty) {
      setState(() {
        widget.todos.elementAt(index).taskName = _taskController.text;
        Navigator.of(context).pop();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: widget.todos.length,
      itemBuilder: (context, index) {
        Todo todo = widget.todos[index];
        return Card(
          margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
          child: ListTile(
            subtitle: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(todo.taskName, style: const TextStyle(fontSize: 22)),
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: Text(todo.date.toString().substring(0, 10)),
                    ),
                  ],
                ),
                Row(children: [
                  IconButton(
                      onPressed: () => onDelete(index),
                      icon: const Icon(Icons.delete)),
                  Checkbox(
                      value: todo.isCompleted,
                      onChanged: (e) => onComplete(index)),
                  ElevatedButton(
                    onPressed: () => {
                      _taskController.text = todo.taskName,
                      showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              content: Container(
                                width: 200,
                                height: 200,
                                child: Column(children: [
                                  Expanded(
                                    child: TextField(
                                      controller: _taskController,
                                      decoration: const InputDecoration(
                                          hintText: 'Enter task name'),
                                    ),
                                  ),
                                  ElevatedButton(
                                      onPressed: () => onEdit(index),
                                      child: const Text('save'))
                                ]),
                              ),
                            );
                          })
                    },
                    child: Icon(Icons.edit,
                        color: Color.fromARGB(207, 19, 17, 17)),
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(
                        const Color.fromARGB(255, 176, 171, 171),
                      ),
                      padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                          EdgeInsets.zero),
                    ),
                  )
                  // const IconButton(onPressed: null, icon: Icon(Icons.edit))
                ]),
              ],
            ),
          ),
        );
      },
    );
  }
}
