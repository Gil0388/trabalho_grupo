import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:trabalho_grupo/controller/todos_controller.dart';
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
    context.read<TodosController>().getTodoList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: pink,
        body: SingleChildScrollView(
          child: Consumer<TodosController>(
            builder: (context, todoController, child) {
              return Column(
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
                        controller: todoController.searchController,
                        decoration: textFormFieldDecoratorPage5(
                            "Busque palavras-chave", () {}),
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
                        itemCount: controller.todoList.length,
                        itemBuilder: (context, index) {
                          return const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Card(
                              child: ListTile(
                                title: Text("teste"),
                                subtitle: Text("teste"),
                              ),
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
              );
            },
          ),
        ),
      ),
    );
  }
}
