import 'package:flutter/material.dart';

import '../styles/colors_style.dart';

class FirstPage extends StatelessWidget {
  const FirstPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: pink,
      body: Column(
        children: [
          const Text('LOGO'),
          const Text('Lovepeople'),
          const Text('Quem bom que voltou!'),
          TextFormField(
            decoration: const InputDecoration(
                hintText: 'Numero de telefone, email ou CPF'),
          ),
          TextFormField(
            decoration: const InputDecoration(hintText: 'Senha'),
          ),
          const Row(
            children: [
              Text('Esqueceu seu login ou senha? '),
              Text('Clique aqui')
            ],
          ),
          FilledButton(onPressed: () {}, child: const Text('Entrar'))
        ],
      ),
      bottomNavigationBar: const Row(
        children: [Text('Nao possui cadastro?'), Text('Clique aqui')],
      ),
    );
  }
}
