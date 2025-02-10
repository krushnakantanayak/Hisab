import 'package:flutter/material.dart';
import 'package:hisab/todo/model/todo_model.dart';

class TodoProvider extends ChangeNotifier {
  final List<Todo> _todos = [];

  List<Todo> get todos => _todos;

  void addTodo(String task) {
    _todos.add(Todo(task: task));
    notifyListeners();
  }

  void deleteTodo(int index) {
    _todos.removeAt(index);
    notifyListeners();
  }
}
