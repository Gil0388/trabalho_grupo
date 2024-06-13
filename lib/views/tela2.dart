import 'package:flutter/material.dart';

import '../styles/styles.dart';

class SecondPage extends StatelessWidget {
  const SecondPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: pink,
      resizeToAvoidBottomInset: false,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // FORMULARIO DE LOGIN

          Container(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.only(top: 25),
                ),
                const Text(
                  'Vamos começar!',
                  style: TextStyle(
                      color: white, fontFamily: 'Montserrat', fontSize: 25),
                ),
                bigSpacer,
                TextFormField(
                  decoration: textFormFieldDecorator('Nome'),
                ),
                mediumSpacer,
                TextFormField(
                  decoration: textFormFieldDecorator(
                      'Número de telefone, email ou CPF'),
                ),
                mediumSpacer,
                TextFormField(
                  decoration: textFormFieldDecorator('Senha'),
                ),
                mediumSpacer,
                TextFormField(
                  decoration: textFormFieldDecorator('Confirmar senha'),
                ),
                bigSpacer,
                FilledButton(
                  style: buttonStyle,
                  onPressed: () {
                    Navigator.pushNamed(context, '/CadastroConcluido');
                  },
                  child: const Text(
                    'Cadastrar',
                    style: TextStyle(
                      color: white,
                      fontFamily: 'Montserrat',
                      fontSize: 20,
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
      bottomNavigationBar: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'Já possuí cadastro?',
            style: TextStyle(color: Colors.white, fontSize: 18),
          ),
          TextButton(
            onPressed: () {
              //inclusão da rota já tem cadastro 09/06/2024
              Navigator.pushNamed(context, '/tela1');
            },
            child: const Text(
              'Clique aqui',
              style: TextStyle(color: Colors.yellow, fontSize: 18),
            ),
          ),
        ],
      ),
    );
  }
}
