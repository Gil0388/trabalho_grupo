import 'package:dio/dio.dart';
import 'package:trabalho_grupo/data/local/session_datasource.dart';
import 'package:trabalho_grupo/data/model/todo_model.dart';

class TodoRepository {
  static const todosPath = 'todos';
  final Dio dio;
  final SessionDatasource sessionDatasource;

  TodoRepository(this.dio, this.sessionDatasource);

  Future<TodoResponse> getTodoList() async {
    final session = sessionDatasource.getSession();
    final response = await dio.get(
      "https://todo.rafaelbarbosatec.com/api/todos",
      options: Options(
        headers: {
          'Authorization': 'Bearer ${session?.jwt}',
        },
      ),
    );
    try {
      return TodoResponse.fromMap(response.data);
    } catch (e) {
      return throw Exception(e);
    }
    //     .then((response) {
    //   return (response.data['data'] as List).map((e) {
    //     return TodoResponse.fromMap(e);
    //   }).toList();
    // });
  }

  void loggout() async {
    await sessionDatasource.deleteSession();
  }

Future postTodo() async {
    final session = sessionDatasource.getSession();
    final response = await dio.post(todosPath,
        options: Options(headers: {'Authorization': 'Bearer ${session?.jwt}'}),
        data: {
          'data': {
            'title': 'Fazer o Login',
            'description': 'Criação da tela de login',
            'color': '#FFFFFF'
          }
        });
  }

  Future deleteTodo(int id) async {
    final session = sessionDatasource.getSession();
    await dio.delete(
      "$todosPath/$id",
      options: Options(
        headers: {
          'Authorization': 'Bearer ${session?.jwt}',
        },
      ),
    );
  }
}