import 'package:dio/dio.dart';
import 'package:trabalho_grupo/data/local/session_datasource.dart';
import 'package:trabalho_grupo/data/model/todo_model.dart';

class TodoRepository {
  static const todosPath = 'todos';
  final Dio dio;
  final SessionDatasource sessionDatasource;

  TodoRepository(this.dio, this.sessionDatasource);

  Future<List<TodoModel>> getTodoList() {
    final session = sessionDatasource.getSession();
    return dio
        .get(
      "https://todo.rafaelbarbosatec.com/api/${todosPath}",
      options: Options(
        headers: {
          'Authorization': 'Bearer ${session?.jwt}',
        },
      ),
    )
        .then((response) {
      return (response.data['data'] as List).map((e) {
        return TodoModel.fromJson(e);
      }).toList();
    });
  }
}
