import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import '../styles/styles.dart';

class FourthPage extends StatelessWidget {
  const FourthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: pink,
      body: SingleChildScrollView(
        //Resolver o Erro Bottom Overflowed no Flutter quando o Teclado abre

        child: Column(
          // LOGO DA LOVEPEOPLE E NOME
          children: [
            Container(padding: const EdgeInsets.only(top: 26),),
            Row(
              //crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  height: 100.0,
                  width: 100.0,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(100.0), // Define o raio desejado
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 8.0), // Ajuste o valor conforme necessário
                    child: Align(
                      alignment: Alignment.centerLeft, // Alinha o widget à esquerda
                      child: Image.asset(
                        'assets/images/lovepeople_logo.png',
                        height: 52,
                      ),
                    ),
                  ),

                ),
                Container(
                    height: 100,
                    width: 250.0,
                    child:
                    Container(

                      padding: const EdgeInsets.only(top: 50), // Ajuste o valor conforme necessário
                      alignment: Alignment.topCenter,
                      child: const Text(
                        'Suas Listagens',
                        style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'Montserrat',
                            fontSize: 20),
                      ),
                    )


                ),
              ],
            ),
            // FORMULARIO DE NOTAS
            Container(
              padding: const EdgeInsets.all(30),
              child: Column(

                children: [
                  Container(
                    height: 40, // Defina a altura desejada aqui
                    decoration: BoxDecoration(
                      color: Colors.white, // Define a cor de fundo como branco
                      borderRadius: BorderRadius.circular(9.0), // Opcional: arredonda as bordas
                    ),
                    child: TextFormField(
                      decoration: const InputDecoration(
                        hintText: 'Busque palavras-chave ',
                        hintStyle: TextStyle(fontWeight: FontWeight.bold, color: Color(0xffa901f7)),
                        border: InputBorder.none, // Remove a borda padrão do TextFormField
                        contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 16.0),
                        suffixIcon: Icon(Icons.search, color: Color(0xffa901f7)),
                      ),
                      style: TextStyle(
                        fontFamily: 'Montserrat',
                      ),
                    ),

                  ),

                  const SizedBox(height: 16.0), // Espaço entre os elementos



                  const SizedBox(height: 120.0),


                ],
              ),
            )




          ],
        ),
      ),
      bottomNavigationBar: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Transform.translate(
            offset: Offset(0, -60), // move 30 pixels up
            child: Icon(
              CupertinoIcons.add,
              color: Colors.white,
              size: 90,
            ),
          ),
        ],
      ),


    );
  }
}
