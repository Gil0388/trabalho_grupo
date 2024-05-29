import 'package:flutter/material.dart';

import '../styles/styles.dart';

class FirstPage extends StatelessWidget {
  const FirstPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: pink,
      body: Column(
        children: [
          // LOGO DA LOVEPEOPLE E NOME
          Container(
            color: white,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: [
                    Image.asset(
                      'assets/images/lovepeople_logo.png',
                      height: 100,
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
          const Text(
            'Quem bom que voltou!',
            style:
                TextStyle(color: white, fontFamily: 'Montserrat', fontSize: 20),
          ),
          TextFormField(
            decoration:
                textFormFieldDecorator('Número de telefone, email ou CPF'),
          ),
          TextFormField(
            decoration: textFormFieldDecorator('Senha'),
          ),
          Row(
            children: [
              const Text(
                'Esqueceu seu login ou senha? ',
                style: TextStyle(color: white, fontSize: 12),
              ),
              TextButton(
                onPressed: () {},
                child: const Text(
                  'Clique aqui',
                  style: TextStyle(color: yellow, fontSize: 12),
                ),
              ),
            ],
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
      bottomNavigationBar: Row(
        children: [
          const Text(
            'Não possui cadastro?',
            style: TextStyle(color: white, fontSize: 14),
          ),
          TextButton(
            onPressed: () {},
            child: const Text(
              'Clique aqui',
              style: TextStyle(color: yellow, fontSize: 14),
            ),
          ),
        ],
      ),
    );
  }
}
