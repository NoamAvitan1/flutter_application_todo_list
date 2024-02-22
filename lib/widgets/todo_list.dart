import 'package:flutter/material.dart';
import 'package:flutter_application_1/classes/todo_class.dart';
import 'package:flutter_application_1/widgets/todo.dart';

class TodoList extends StatefulWidget {
  const TodoList({super.key});

  @override
  State<TodoList> createState() => _TodoListState();
}

class _TodoListState extends State<TodoList> {
  List<Todo> todos = [
    Todo(
        date: DateTime(2017, 9, 7, 17, 30),
        taskName: "football",
        isCompleted: false),
    Todo(
        date: DateTime(2017, 9, 7, 17, 30),
        taskName: "Movie",
        isCompleted: false),
  ];

  final TextEditingController _taskController = TextEditingController();

  void addTodo() {
    if (_taskController.text.isNotEmpty) {
      setState(() {
        todos.add(
          Todo(
            date: DateTime.now(),
            taskName: _taskController.text,
            isCompleted: false,
          ),
        );
        _taskController.clear();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Todo List'),
      ),
      body: Column(
        children: [
          Expanded(
            child: TodoItems(todos: todos),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _taskController,
                    decoration: const InputDecoration(
                      hintText: 'Enter task name',
                    ),
                  ),
                ),
                IconButton(
                  onPressed: () => addTodo(),
                  icon: const Icon(Icons.add),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
