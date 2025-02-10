import 'package:flutter/material.dart';
import 'package:hisab/todo/todo_provider.dart';
import 'package:provider/provider.dart';

class TodoPage extends StatefulWidget {
  const TodoPage({super.key});

  @override
  _TodoPageState createState() => _TodoPageState();
}

class _TodoPageState extends State<TodoPage> {
  final TextEditingController _taskController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final todoProvider = Provider.of<TodoProvider>(context);

    return Scaffold(
      appBar: AppBar(title: const Text('To-Do List')),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _taskController,
              decoration: const InputDecoration(labelText: 'Enter Task'),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              if (_taskController.text.isNotEmpty) {
                todoProvider.addTodo(_taskController.text);
                _taskController.clear();
              }
            },
            child: const Text('Add Task'),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: todoProvider.todos.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(todoProvider.todos[index].task),
                  trailing: IconButton(
                    icon: const Icon(Icons.delete, color: Colors.red),
                    onPressed: () => todoProvider.deleteTodo(index),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
