import 'package:flutter/material.dart';
import 'package:trabalho_grupo/controller/todos_controller.dart';
import 'package:trabalho_grupo/core/dio_client.dart';
import 'package:trabalho_grupo/data/model/todo_repository.dart';
import 'package:trabalho_grupo/main.dart';
import 'package:trabalho_grupo/styles/styles.dart';
import 'package:trabalho_grupo/widgets/cards_e_funcoes.dart';

class FivePage extends StatefulWidget {
  const FivePage({super.key});

  @override
  State<FivePage> createState() => _FivePageState();
}

class _FivePageState extends State<FivePage> {
  late TodosController controller;
  List<Lista> listagem = [];
  List<Lista> lixeira = [];
  List<Lista> listagemFiltrada = [];
  TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    controller = TodosController(
      todoRepository: TodoRepository(
        DioClient.create(),
        sessionDatasource,
      ),
      sessionDatasource: sessionDatasource,
    );
    controller.getTodoList();
    super.initState();
  }

  void onSearchIconTapped() {
    String query = searchController.text.toLowerCase();
    setState(() {
      listagemFiltrada = listagem
          .where((item) =>
              item.titulo.toLowerCase().contains(query) ||
              item.descricao.toLowerCase().contains(query))
          .toList();
    });
  }

  void apagarCard(int index) {
    setState(() {
      listagem.removeAt(index);
      onSearchIconTapped();
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: pink,
        body: SingleChildScrollView(
          child: Column(
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
                padding: const EdgeInsets.only(left: 30, right: 30, top: 30),
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20)),
                  child: TextFormField(
                    controller: searchController,
                    decoration: textFormFieldDecoratorPage5(
                        "Busque palavras-chave", onSearchIconTapped),
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
                  child: ListenableBuilder(
                      listenable: controller,
                      builder: (context, child) {
                        return ListView.builder(
                          itemCount: controller.todoList.length,
                          itemBuilder: (context, index) {
                            final todo = controller.todoList[index];
                            return Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Card(
                                child: ListTile(
                                  title: Text(todo.title),
                                  subtitle: Text(todo.description),
                                ),
                              ),
                            );
                          },
                        );
                      }),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 1.0),
                child: ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/tela6').then((novoValor) {
                        if (novoValor != null) {
                          setState(() {
                            listagem.add(novoValor as Lista);
                            onSearchIconTapped();
                          });
                        }
                      });
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
          ),
        ),
      ),
    );
  }
}
