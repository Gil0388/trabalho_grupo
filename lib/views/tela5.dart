import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart'; // Importe o pacote shared_preferences
import 'package:trabalho_grupo/styles/styles.dart';
import 'package:trabalho_grupo/widgets/cards_e_funcoes.dart';

class FivePage extends StatefulWidget {
  const FivePage({Key? key}) : super(key: key);

  @override
  State<FivePage> createState() => _FivePageState();
}

class _FivePageState extends State<FivePage> {


  List<Lista> listagem = [];
  List<Lista> lixeira = [];
  List<Lista> listagemFiltrada = [];
  TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    loadListagem(); // Carregar dados ao iniciar a tela
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
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? listagemString = prefs.getString('listagem');
    if (listagemString != null) {
      setState(() {
        listagem = Lista.decode(listagemString);
        listagemFiltrada = listagem;
      });
    }
  }

  void saveListagem() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String encodedListagem = Lista.encode(listagem);
    prefs.setString('listagem', encodedListagem);
  }

  void apagarCard(int index) {
    setState(() {
      listagem.removeAt(index);
      _onSearchIconTapped();
      saveListagem(); // Salvar os dados após apagar um card
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
                        "Busque palavras-chave", _onSearchIconTapped),
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
                      Navigator.pushNamed(context, '/tela6').then((novoValor) {
                        if (novoValor != null) {
                          setState(() {
                            listagem.add(novoValor as Lista);
                            _onSearchIconTapped();
                            saveListagem(); // Salvar os dados ao adicionar um novo card
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
