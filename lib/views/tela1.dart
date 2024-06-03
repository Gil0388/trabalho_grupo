import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';

import '../styles/styles.dart';

class FirstPage extends StatelessWidget {
  const FirstPage({super.key});

  @override
  Widget build(BuildContext context) {
    double topContainerHeight = MediaQuery.of(context).size.width / 2;
    Radius radius = Radius.circular(topContainerHeight);
    const SizedBox bigSpacer = SizedBox(height: 340);
    const SizedBox mediumSpacer = SizedBox(height: 10);

    return SafeArea(
      child: Scaffold(
        backgroundColor: pink,
        resizeToAvoidBottomInset: false,
        appBar: // LOGO DA LOVEPEOPLE E NOME
            PreferredSize(
          preferredSize: Size.fromHeight(topContainerHeight),
          child: Container(
            decoration: BoxDecoration(
                color: white,
                borderRadius:
                    BorderRadius.only(bottomLeft: radius, bottomRight: radius)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
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
              ],
            ),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // FORMULARIO DE LOGIN
              const Text(
                'Quem bom que voltou!',
                style: TextStyle(
                    color: white, fontFamily: 'Montserrat', fontSize: 20),
              ),
              bigSpacer,
              TextFormField(
                decoration:
                    textFormFieldDecorator('Número de telefone, email ou CPF'),
              ),
              mediumSpacer,
              TextFormField(
                decoration: textFormFieldDecorator('Senha'),
                obscureText: true,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Esqueceu seu login ou senha? ',
                    style: TextStyle(
                        color: white, fontSize: 12, fontFamily: 'Tahoma'),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: const Text(
                      'Clique aqui',
                      style: TextStyle(
                          color: yellow, fontSize: 12, fontFamily: 'Tahoma'),
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
        ),
        bottomNavigationBar: SizedBox(
          height: 65,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              const DottedLine(dashColor: white),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Não possui cadastro?',
                      style: TextStyle(
                          color: white, fontSize: 14, fontFamily: 'Tahoma'),
                    ),
                    TextButton(
                      onPressed: () {},
                      child: const Text(
                        'Clique aqui',
                        style: TextStyle(
                            color: yellow, fontSize: 14, fontFamily: 'Tahoma'),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
