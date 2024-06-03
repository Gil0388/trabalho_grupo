import 'package:flutter/material.dart';

import '../styles/styles.dart';

class FirstPage extends StatelessWidget {
  const FirstPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: yellow,
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.only(top: 35),
          child: Column(
            children: [
              // LOGO DA LOVEPEOPLE E NOME
              Container(
                height: 220.0, // Altere o valor conforme necessário
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(
                        220.0), // Altere o valor do raio conforme necessário
                    bottomRight: Radius.circular(
                        220.0), // Altere o valor do raio conforme necessário
                  ),
                ),

                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      children: [
                        Container(
                          padding: const EdgeInsets.only(top: 80),
                          child: Image.asset(
                            'assets/images/lovepeople_logo.png',
                            height: 100,
                          ),
                        ),
                        const Text(
                          'Lovepeople',
                          style: TextStyle(
                              color: purple,
                              fontFamily: 'Montserrat',
                              fontSize: 12),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              // FORMULARIO DE LOGIN

              Container(
                padding: EdgeInsets.symmetric(horizontal: 20.0),
                child: Container(
                  padding: const EdgeInsets.only(top: 100),
                  child: Column(
                    children: [
                      const Text(
                        'Que bom que voltou!',
                        style: TextStyle(
                            color: white,
                            fontFamily: 'Montserrat',
                            fontSize: 25),
                      ),
                      Container(
                        padding: const EdgeInsets.only(top: 30),
                      ),
                      TextFormField(
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.blue,
                        ),
                        decoration: textFormFieldDecorator(
                            'Número de telefone, email ou CPF'),
                      ),
                      Container(
                        padding: const EdgeInsets.only(top: 10),
                      ),
                      TextFormField(
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.blue,
                        ),
                        decoration: textFormFieldDecorator('Senha'),
                      ),
                      Container(
                        padding: const EdgeInsets.only(top: 5),
                      ),
                      Row(
                        children: [
                          const Text(
                            'Esqueceu seu login ou senha? ',
                            style: TextStyle(color: white, fontSize: 15),
                          ),
                          TextButton(
                            onPressed: () {},
                            child: const Text(
                              'Clique aqui',
                              style: TextStyle(color: yellow, fontSize: 15),
                            ),
                          ),
                        ],
                      ),
                      Container(
                        padding: const EdgeInsets.only(top: 25),
                      ),
                      FilledButton(
                        style: buttonStyle,
                        onPressed: () {},
                        child: const Text(
                          'Entrar',
                          style: TextStyle(
                            color: white,
                            fontFamily: 'Montserrat',
                            fontSize: 16,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'Não possui cadastro?',
            style: TextStyle(color: Colors.white, fontSize: 14),
          ),
          TextButton(
            onPressed: () {},
            child: const Text(
              'Clique aqui',
              style: TextStyle(color: Colors.yellow, fontSize: 14),
            ),
          ),
        ],
      ),
    );
  }
}
