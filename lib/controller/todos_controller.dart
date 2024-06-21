import 'package:flutter/material.dart';
import 'package:trabalho_grupo/data/model/todo_model.dart';
import 'package:trabalho_grupo/data/model/todo_repository.dart';

class TodosController extends ChangeNotifier {
  final TodoRepository todoRepository;

  List<TodoModel> todoList = [];
  TextEditingController searchController = TextEditingController();

  TodosController({
    required this.todoRepository,
  });

  void loggout() {
    todoRepository.loggout();
  }

  void getTodoList() {
    todoRepository.getTodoList().then((e) {
      todoList = e;
      notifyListeners();
    }).catchError((e) {
      print(e);
    });
  }

  // void onSearchIconTapped() {
  //   String query = searchController.text.toLowerCase();
  //     todoList = listagem
  //         .where((item) =>
  //             item.titulo.toLowerCase().contains(query) ||
  //             item.descricao.toLowerCase().contains(query))
  //         .toList();
  // }

  void apagarCard(int index) {
    todoList.removeAt(index);
    notifyListeners();
  }
}
