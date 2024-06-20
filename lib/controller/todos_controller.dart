import 'package:flutter/material.dart';
import 'package:trabalho_grupo/data/local/session_datasource.dart';
import 'package:trabalho_grupo/data/model/todo_model.dart';
import 'package:trabalho_grupo/data/model/todo_repository.dart';

class TodosController extends ChangeNotifier {
  final TodoRepository todoRepository;
  final SessionDatasource sessionDatasource;

  List<TodoModel> todoList = [];

  TodosController({
    required this.todoRepository,
    required this.sessionDatasource,
  });

  void getTodoList() {
    todoRepository.getTodoList().then((e) {
      todoList = e;
      notifyListeners();
    }).catchError((e) {
      print(e);
    });
  }

  void loggout(Function() callback) async {
    await sessionDatasource.deleteSession();
    callback();
  }
}