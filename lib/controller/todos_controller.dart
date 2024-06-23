import 'package:flutter/material.dart';
import 'package:trabalho_grupo/data/model/todo_model.dart';
import 'package:trabalho_grupo/data/model/todo_repository.dart';

class TodosController extends ChangeNotifier {
  final TodoRepository todoRepository;

  List<TodoModel> todoList = [];
  List<TodoModel> filtrada = [];
  TextEditingController searchController = TextEditingController();

  TodosController({
    required this.todoRepository,
  });

  void loggout() {
    todoRepository.loggout();
  }

  void getTodoList() async {
    final response = await todoRepository.getTodoList();
    try {
      todoList = response.todoListAPI;
      filtrada = todoList;
      notifyListeners();
    } catch (e) {
      todoList = [];
      notifyListeners();
    }
  }

  void onSearchIconTapped() {
    String query = searchController.text.toLowerCase();
    if (query.isEmpty) {
      filtrada = todoList;
    } else {
      filtrada = todoList
          .where((item) =>
              item.titulo.toLowerCase().contains(query) ||
              item.descricao.toLowerCase().contains(query))
          .toList();
    }
    notifyListeners();
  }
 
  Future<void> apagarCard(int id) async {
    await todoRepository.deleteTodo(id);
    todoList.removeWhere((todo) => todo.id == id);
    filtrada = todoList;
    notifyListeners();
  }

  void postTodo() async {
    await todoRepository.postTodo();
    getTodoList();
  }
}
