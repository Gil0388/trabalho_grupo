import 'package:flutter/material.dart';

import '../styles/styles.dart';

class SignUpSuccessPage extends StatelessWidget {
  const SignUpSuccessPage({super.key});

  @override
  Widget build(BuildContext context) {
    double bottomContainerHeight = MediaQuery.of(context).size.width / 2;
    Radius radius = Radius.circular(bottomContainerHeight);

    return Scaffold(
      backgroundColor: pink,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Cadastro concluído! ',
              style: TextStyle(
                  color: white, fontFamily: 'Montserrat', fontSize: 30),
            ),
            bigSpacer,
            FilledButton(
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
          ],
        ),
      ),
      bottomNavigationBar: Container(
        width: double.infinity,
        height: bottomContainerHeight + 50,
        decoration: BoxDecoration(
          color: white,
          borderRadius: BorderRadius.only(
            topLeft: radius,
            topRight: radius,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/coruja.png',
              fit: BoxFit.contain,
              width: 150,
              height: 150,
            ),
            const Text(
              'Os ventos da programação estão indo até você',
              style: TextStyle(
                color: purple, // Define a cor pink
                fontSize: 15, // Define o tamanho da fonte como 20
                fontFamily: 'Tahoma',
                fontWeight: FontWeight.normal, // Define o estilo negrito
              ),
            )
          ],
        ),
      ),
    );
  }
}
