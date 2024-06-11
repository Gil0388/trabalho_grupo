import 'package:flutter/material.dart';

import '../styles/styles.dart';

class ThreetPage extends StatelessWidget {
  const ThreetPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: pink,
        body: SingleChildScrollView(
          child: Column(
            children: [
              Center(
                child: Container(
                  padding: const EdgeInsets.only(top: 250),
                  child: Column(
                    children: [
                      Container(
                        padding: const EdgeInsets.only(top: 50),
                        child: const Text(
                          'Cadastro concluído! ',
                          style: TextStyle(
                              color: white,
                              fontFamily: 'Montserrat',
                              fontSize: 30),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.only(top: 50),
                        child: FilledButton(
                          style: buttonStyle,
                          onPressed: () {
                            Navigator.pushNamed(context, '/tela5');
                          },
                          child: const Text(
                            'Começar',
                            style: TextStyle(
                              color: white,
                              fontFamily: 'Montserrat',
                              fontSize: 20,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.only(top: 280),
              ),
              Center(
                child: Container(
                  width: double.infinity,
                  height: 260.0,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(300.0),
                      topRight: Radius.circular(300.0),
                    ),
                  ),
                  child: Stack(
                    children: <Widget>[
                      Container(
                        padding: const EdgeInsets.only(top: 40),
                        child: Column(
                          children: [
                            Center(
                              child: Image.asset(
                                'assets/images/coruja.png',
                                fit: BoxFit.contain,
                                width: 150,
                                height: 150,
                              ),
                            ),
                            const Text(
                              'Os ventos da programação estão indo até você',
                              style: TextStyle(
                                color: Color(0xff3101B9), // Define a cor pink
                                fontSize:
                                    20, // Define o tamanho da fonte como 20
                                fontFamily: 'Tahoma',
                                fontWeight:
                                    FontWeight.bold, // Define o estilo negrito
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
