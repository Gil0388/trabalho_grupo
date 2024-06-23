import 'package:flutter/material.dart';
import 'package:trabalho_grupo/controller/todos_controller.dart';
import 'package:trabalho_grupo/core/dio_client.dart';
import 'package:trabalho_grupo/data/model/todo_model.dart';
import 'package:trabalho_grupo/data/model/todo_repository.dart';
import 'package:trabalho_grupo/main.dart';
import 'package:trabalho_grupo/styles/styles.dart';

class ListPage extends StatefulWidget {
  const ListPage({super.key});

  @override
  State<ListPage> createState() => _FivePageState();
}

class _FivePageState extends State<ListPage> {
  late TodosController controller;
  @override
  void initState() {
    controller = TodosController(
        todoRepository: TodoRepository(DioClient.create(), sessionDatasource));
    // controller.postTodo();
    controller.getTodoList();
    super.initState();
  }

//! Coloquei aqui o metodo que vai chamar a função de deletar.
  void deleteConfirmation(int id, String titulo) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text(
            "Deseja deletar este item?",
            style: TextStyle(
                color: purple, fontSize: 20, fontFamily: 'Montserrat'),
          ),
          content: Text(
            "\"$titulo\" será movido para a lixeira.",
            style: const TextStyle(
                color: purple, fontSize: 15, fontFamily: 'Montserrat'),
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
        List<TodoModel> todoList = controller.filtrada;
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
                              padding:
                                  const EdgeInsets.only(left: 12, bottom: 10),
                              child: GestureDetector(
                                onTap: () {
                                  Navigator.pop(context);
                                },
                                child: Align(
                                  alignment: Alignment.centerLeft,
                                  child: Image.asset(
                                    'assets/images/lovepeople_logo.png',
                                    height: 56,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Container(
                            height: 100,
                            width: 240,
                            alignment: Alignment.bottomCenter,
                            child: const Text(
                              'Suas Listagens',
                              style: TextStyle(
                                  fontFamily: 'Montserrat',
                                  color: Colors.white,
                                  fontSize: 27),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(left: 30, right: 30, top: 30),
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20)),
                        child: TextFormField(
                          controller: controller.searchController,
                          decoration: textFormFieldDecoratorPage5(
                              "Busque palavras-chave", () {}),
                          onChanged: (value) {
                            controller.onSearchIconTapped();
                          },
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 30.0),
                      child: SizedBox(
                        height: 540,
                        child: ListView.builder(
                          itemCount: todoList.length,
                          itemBuilder: (context, index) {
                            return Card(
                              child: Stack(
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      ListTile(
                                        title: Text(todoList[index].titulo),
                                        subtitle:
                                            Text(todoList[index].descricao),
                                      ),
                                    ],
                                  ),
                                  Positioned(
                                    top: 0,
                                    right: 0,
                                    child: IconButton(
                                      icon: const Icon(Icons.delete),
                                      onPressed: () {
                                        deleteConfirmation(
                                          todoList[index].id,
                                          todoList[index].titulo,
                                        );
                                      },
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 1.0),
                      child: ElevatedButton(
                          onPressed: () {
                            Navigator.pushNamed(context, '/tela6');
                          },
                          style: ElevatedButton.styleFrom(
                              backgroundColor: pink, elevation: 0.0),
                          child: const Icon(
                            Icons.add,
                            size: 100,
                            color: Colors.white,
                          )),
                    )
                  ],
                )));
      },
    );
  }
}
