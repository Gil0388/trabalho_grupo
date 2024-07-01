import 'package:dio/dio.dart';
import 'package:trabalho_grupo/data/local/session_datasource.dart';
import 'package:trabalho_grupo/data/model/todo_model.dart';

class TodoRepository {
  static const todosPath = 'https://todo.rafaelbarbosatec.com/api/todos';
  final Dio dio;
  final SessionDatasource sessionDatasource;

  TodoRepository(this.dio, this.sessionDatasource);

  Future<TodoResponse> getTodoList() async {
    final session = sessionDatasource.getSession();
    final response = await dio.get(
      todosPath,
      options: Options(
        headers: {
          'Authorization': 'Bearer ${session?.jwt}',
        },
      ),
    );
    try {
      return TodoResponse.fromMap(response.data);
    } catch (e) {
      throw Exception(e);
    }
  }

  void loggout() async {
    await sessionDatasource.deleteSession();
  }

  Future<void> postTodo(TodoModel todo) async {
    final session = sessionDatasource.getSession();
    await dio.post(
      todosPath,
      options: Options(
        headers: {'Authorization': 'Bearer ${session?.jwt}'},
      ),
      data: {
        'data': {
          'title': todo.titulo,
          'description': todo.descricao,
          'color': todo.cores != null ? '#${todo.cores!.value.toRadixString(16).substring(2)}' : '#FFFFFF',
        },
      },
    );
  }

  Future<void> deleteTodo(int id) async {
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
