import 'package:flutter/material.dart';
import 'package:trabalho_grupo/styles/styles.dart';
import 'package:trabalho_grupo/widgets/cards_e_funcoes.dart';

class FivePage extends StatefulWidget {
  const FivePage({super.key});

  @override
  State<FivePage> createState() => _FivePageState();
}

class _FivePageState extends State<FivePage> {
  List<Lista> listagem = [];

//! Metodo parara apagar o card.
  void apagarCard(int index) {
    setState(() {
      listagem.removeAt(index);
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
//! Layout da logo.
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
//! Botão Navigator => "/Tela Anterior".
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
//! Layout do titulo da pagina.
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
//! Layout do campo de pesquisa.
              Padding(
                padding: const EdgeInsets.only(left: 30, right: 30, top: 30),
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20)),
                  child: TextFormField(
                    decoration:
                        textFormFieldDecoratorPage5('Busque palavra-chave'),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              //! Builder para gerar os Cards e suas funções.
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30.0),
                child: SizedBox(
                  height: 540,
                  child: ListView.builder(
                    itemCount: listagem.length,
                    itemBuilder: (context, index) {
                      return Cards(
                        title: listagem[index].titulo,
                        subtitle: listagem[index].descricao,
                        color: listagem[index].cores,
                        deletar: () {
                          apagarCard(index);
                        },
                      );
                    },
                  ),
                ),
              ),
              //! Botão Navigator => /tela6.
              Padding(
                padding: const EdgeInsets.only(top: 1.0),
                child: ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/tela6').then((novoValor) {
                        if (novoValor != null) {
                          setState(() {
                            listagem.add(novoValor as Lista);
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
