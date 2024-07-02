import 'package:flutter/material.dart';
import 'package:trabalho_grupo/controller/todos_controller.dart';
import 'package:trabalho_grupo/core/dio_client.dart';
import 'package:trabalho_grupo/data/model/todo_model.dart';
import 'package:trabalho_grupo/data/model/todo_repository.dart';
import 'package:trabalho_grupo/main.dart';
import 'package:trabalho_grupo/styles/styles.dart';

class ListPage extends StatefulWidget {
  const ListPage({Key? key}) : super(key: key);

  @override
  _ListPageState createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  late TodosController controller;
  List<TodoModel> todoList = [];

  @override
  void initState() {
    controller = TodosController(
      todoRepository: TodoRepository(DioClient.create(), sessionDatasource),
    );
    controller.getTodoList();
    super.initState();
  }

  Future<void> _navigateAndAddTodo() async {
    final result = await Navigator.pushNamed(context, '/tela6');
    if (result != null && result is TodoModel) {
      await controller.postTodo(result);
      setState(() {
        todoList = controller.todoList;
      });
    }
  }

  void deleteConfirmation(int id, String titulo) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text(
            "Deseja deletar este item?",
            style: TextStyle(
              color: purple,
              fontSize: 20,
              fontFamily: 'Montserrat',
            ),
          ),
          content: Text(
            "\"$titulo\" será movido para a lixeira.",
            style: const TextStyle(
              color: purple,
              fontSize: 15,
              fontFamily: 'Montserrat',
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text(
                "Confirmar",
                style: TextStyle(color: purple, fontFamily: 'Montserrat'),
              ),
              onPressed: () {
                controller.apagarCard(id);
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: const Text(
                "Cancelar",
                style: TextStyle(color: pink, fontFamily: 'Montserrat'),
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: controller,
      builder: (context, child) {
        return SafeArea(
          child: Scaffold(
            resizeToAvoidBottomInset: false,
            backgroundColor: pink,
            body: Column(
              children: [
                Align(
                  alignment: Alignment.topLeft,
                  child: Row(
                    children: [
                      Container(
                        width: 100,
                        height: 100,
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                            bottomRight: Radius.circular(100.0),
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 12, bottom: 10),
                          child: GestureDetector(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: Padding(
                              padding:
                              const EdgeInsets.only(left: 12, bottom: 10),
                              child: GestureDetector(
                                onTap: () {
                                  Navigator.pop(context);
                                },
                                child: Align(
                                  alignment: Alignment(-2.0, 0.0),  // -1.0 para a esquerda, 0.0 para o centro vertical
                              child: Image.asset(
                                'assets/images/lovepeople_logo.png',
                                height: 56,
                              ),
                            ),

                              ),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        height: 100,
                        width: 240,
                        alignment: Alignment.bottomCenter,
                        child: const Padding(
                          padding: EdgeInsets.only(bottom: 20, right: 25),
                          child: Text(
                            'Lista de tarefas',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 24,
                              fontFamily: 'Montserrat',
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: TextField(
                    controller: controller.searchController,
                    onChanged: (value) {
                      controller.onSearchIconTapped();
                    },
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      hintText: 'Pesquisar',
                      hintStyle: const TextStyle(
                        color: Color(0xFFCECECE),
                        fontFamily: 'Montserrat',
                      ),
                      contentPadding: const EdgeInsets.only(
                        left: 12,
                        bottom: 8,
                        top: 8,
                        right: 12,
                      ),
                      focusedBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: pink),
                        borderRadius: BorderRadius.all(
                          Radius.circular(12.0),
                        ),
                      ),
                      enabledBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: purple),
                        borderRadius: BorderRadius.all(
                          Radius.circular(12.0),
                        ),
                      ),
                      suffixIcon: const Icon(
                        Icons.search,
                        color: purple,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: controller.filtrada.length,
                    itemBuilder: (context, index) {
                      TodoModel todo = controller.filtrada[index];
                      return Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0), // Aqui você define o raio do arredondamento
                        ),
                        margin: const EdgeInsets.symmetric(
                          vertical: 6,
                          horizontal: 8,
                        ),
                        child: ListTile(
                          title: Text(
                            todo.titulo,
                            style: const TextStyle(
                              color: purple,
                              fontFamily: 'Montserrat',
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          subtitle: Text(
                            todo.descricao,
                            style: const TextStyle(
                              color: purple,
                              fontFamily: 'Montserrat',
                            ),
                          ),
                          trailing: IconButton(
                            icon: const Icon(Icons.delete, color: pink),
                            onPressed: () {
                              deleteConfirmation(todo.id, todo.titulo);
                            },
                          ),
                          tileColor: todo.cores ?? Colors.white,
                        ),
                      );

                    },
                  ),
                ),
              ],
            ),
            floatingActionButton: Container(
              width: double.infinity,
              alignment: Alignment.bottomCenter,
              padding: const EdgeInsets.all(16.0),
              child: FloatingActionButton(
                onPressed: _navigateAndAddTodo,
                backgroundColor: Colors.purple,
                child: const Icon(Icons.add, color: Colors.white),
              ),
            ),
          ),
        );
      },
    );
  }
}

