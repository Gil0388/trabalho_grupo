import 'dart:convert';
import 'package:flutter/material.dart';

class Cards extends StatelessWidget {
  final String title;
  final String subtitle;
  final Color? color;
  final VoidCallback deletar;

  const Cards({
    Key? key,
    required this.title,
    required this.subtitle,
    required this.color,
    required this.deletar,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: color,
      child: ListTile(
        title: Text(title),
        subtitle: Text(subtitle),
        trailing: IconButton(
          icon: Icon(Icons.delete),
          onPressed: () {
            _showDeleteConfirmationDialog(context);
          },
        ),
      ),
    );
  }

  void _showDeleteConfirmationDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Deseja deletar este item?'),
          content: Text("\"$title\" será removido para a lixeira."),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text("Cancelar"),
            ),
            TextButton(
              onPressed: () {
                deletar();
                Navigator.of(context).pop();
              },
              child: Text("Confirmar"),
            ),
          ],
        );
      },
    );
  }
}

class Lista {
  String titulo;
  String descricao;
  Color? cores;

  Lista({
    required this.titulo,
    required this.descricao,
    required this.cores,
  });

  static String encode(List<Lista> listagem) {
    List<Map<String, dynamic>> mapList = listagem.map((item) => {
      'titulo': item.titulo,
      'descricao': item.descricao,
      'cores': item.cores?.value,
    }).toList();
    return json.encode(mapList);
  }

  static List<Lista> decode(String listagemString) {
    List<dynamic> mapList = json.decode(listagemString);
    return mapList.map((item) {
      return Lista(
        titulo: item['titulo'],
        descricao: item['descricao'],
        cores: item['cores'] != null ? Color(item['cores']) : null,
      );
    }).toList();
  }
}

class FivePage extends StatefulWidget {
  const FivePage({Key? key}) : super(key: key);

  @override
  State<FivePage> createState() => _FivePageState();
}

class _FivePageState extends State<FivePage> {
  List<Lista> listagem = [];
  List<Lista> listagemFiltrada = [];
  TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    loadListagem();
    searchController.addListener(_onSearchIconTapped);
  }

  void _onSearchIconTapped() {
    String query = searchController.text.toLowerCase();
    setState(() {
      listagemFiltrada = listagem
          .where((item) =>
      item.titulo.toLowerCase().contains(query) ||
          item.descricao.toLowerCase().contains(query))
          .toList();
    });
  }

  void loadListagem() async {
    listagem = [
      Lista(
        titulo: 'Título 1',
        descricao: 'Descrição 1',
        cores: Colors.blue,
      ),
      Lista(
        titulo: 'Título 2',
        descricao: 'Descrição 2',
        cores: Colors.green,
      ),
      Lista(
        titulo: 'Título 3',
        descricao: 'Descrição 3',
        cores: Colors.red,
      ),
    ];
    listagemFiltrada = listagem;
  }

  void apagarCard(int index) {
    setState(() {
      listagem.removeAt(index);
      _onSearchIconTapped();
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.pink,
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
                          fontSize: 27,
                        ),
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
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: TextFormField(
                    controller: searchController,
                    decoration: InputDecoration(
                      hintText: "Busque palavras-chave",
                      prefixIcon: Icon(Icons.search),
                    ),
                    onChanged: (_) => _onSearchIconTapped(),
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
                    itemCount: listagemFiltrada.length,
                    itemBuilder: (context, index) {
                      return Cards(
                        title: listagemFiltrada[index].titulo,
                        subtitle: listagemFiltrada[index].descricao,
                        color: listagemFiltrada[index].cores,
                        deletar: () {
                          apagarCard(index);
                        },
                      );
                    },
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 1.0),
                child: ElevatedButton(
                  onPressed: () {
                    // Navegação para adicionar um novo card (simulado)
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.pink,
                    elevation: 0.0,
                  ),
                  child: const Icon(
                    Icons.add,
                    size: 100,
                    color: Colors.white,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: FivePage(),
  ));
}
