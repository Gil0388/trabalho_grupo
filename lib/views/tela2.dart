
import 'package:flutter/material.dart';

import '../styles/styles.dart';

class SecondPage extends StatelessWidget {
  const SecondPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffA901F7),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.only(top: 35),
          child: Column(
            children: [


              // FORMULARIO DE LOGIN

              Container(
                padding: EdgeInsets.symmetric(horizontal: 25.0),
                child: Container(
                  padding: const EdgeInsets.only(top: 250),


                  child: Column(


                    children: [


                      const Text(
                        'Vamos começar!',
                        style:
                        TextStyle(color: white, fontFamily: 'Montserrat', fontSize: 25),
                      ),
                      Container( padding: const EdgeInsets.only(top: 25),),
                      TextFormField(
                        style: TextStyle(
                          fontFamily: 'Tahoma',
                          fontSize: 20,
                          color: Color(0xff3101B9),
                          fontWeight: FontWeight.bold,
                        ),
                        decoration:
                        textFormFieldDecorator('Nome'
                        ),
                      ),
                      Container(          padding: const EdgeInsets.only(top: 15),),
                      TextFormField(
                        style: TextStyle(
                          fontFamily: 'Tahoma',
                          fontSize: 20,
                          color: Color(0xff3101B9),
                          fontWeight: FontWeight.bold,
                        ),
                        decoration: textFormFieldDecorator('Número de telefone, email ou CPF'),
                      ),
                      Container(          padding: const EdgeInsets.only(top: 15),),
                      TextFormField(
                        style: TextStyle(
                          fontFamily: 'Tahoma',
                          fontSize: 18,
                          color: Color(0xff3101B9),
                          fontWeight: FontWeight.bold,
                        ),
                        decoration:
                        textFormFieldDecorator('Senha'
                        ),
                      ),
                      Container(          padding: const EdgeInsets.only(top: 15),),
                      TextFormField(
                        style: TextStyle(
                          fontFamily: 'Tahoma',
                          fontSize: 18,
                          color: Color(0xff3101B9),
                          fontWeight: FontWeight.bold,
                        ),
                        decoration: textFormFieldDecorator('Confirmar senha'),
                      ),
                      Container(          padding: const EdgeInsets.only(top: 35),),

                      FilledButton(
                        style: buttonStyle,
                        onPressed: () {},
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
                ),
              )

            ],
          ),
        ),),

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
