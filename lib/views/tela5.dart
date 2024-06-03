import 'package:flutter/material.dart';
import 'package:trabalho_grupo/styles/styles.dart';

class FivePage extends StatelessWidget {
  const FivePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: pink,
        body: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                // essa Row é responsavel pela logo e titulo ( Suas Listagens).
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
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Image.asset(
                          'assets/images/lovepeople_logo.png',
                          height: 56,
                        ),
                      ),
                    ),
                  ),
                  Center(
                      child: Container(
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
                  )),
                ],
              ),
              Column(
                children: [
                  Padding(
                    // aqui fica a parte do campo de pesquisa.
                    padding:
                        const EdgeInsets.only(left: 30, right: 30, top: 30),
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20)),
                      child: TextFormField(
                        decoration: const InputDecoration(
                          labelText: 'Busque palavras-chave',
                          labelStyle: TextStyle(
                              fontFamily: 'Montserrat', color: purple),
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.symmetric(
                              vertical: 10.0, horizontal: 20.0),
                          suffixIcon: Icon(Icons.search, color: purple),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                // Por hora vou adicionar 3 conteiner para não fica vazio o layout
                padding: const EdgeInsets.only(left: 30.0, right: 30),
                child: Expanded(
                  child: Container(
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        color: yellowLight,
                        borderRadius: BorderRadius.circular(20)),
                    width: 390,
                    height: 150,
                    child: const Text(
                      'Informações...',
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              // Por hora vou adicionar 3 conteiner para não fica vazio o layout
              Padding(
                padding: const EdgeInsets.only(left: 30.0, right: 30),
                child: Expanded(
                  child: Container(
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        color: greenLight,
                        borderRadius: BorderRadius.circular(20)),
                    width: 390,
                    height: 150,
                    child: const Text(
                      'Informações...',
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                // Por hora vou adicionar 3 conteiner para não fica vazio o layout
                padding: const EdgeInsets.only(left: 30.0, right: 30),
                child: Expanded(
                  child: Container(
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        color: pinkLight,
                        borderRadius: BorderRadius.circular(20)),
                    width: 390,
                    height: 150,
                    child: const Text(
                      'Informações...',
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ),

              Padding(
                padding: const EdgeInsets.only(top: 30),
                child: ElevatedButton(
                    onPressed: () {},
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
