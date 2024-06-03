import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import '../styles/styles.dart';

class SixthPage extends StatelessWidget {
  const SixthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          backgroundColor: pink,
             body: SingleChildScrollView(
               //Resolver o Erro Bottom Overflowed no Flutter quando o Teclado abre

               child: Column(
                 // LOGO DA LOVEPEOPLE E NOME
                 children: [
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
                               'Nova Tarefa',
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
                               hintText: 'Título da Tarefa',
                               hintStyle: TextStyle(fontWeight: FontWeight.bold, color: Color(0xffa901f7)),
                               border: InputBorder.none, // Remove a borda padrão do TextFormField
                               contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 16.0), // Adiciona preenchimento interno
                             ),
                             style: TextStyle(
                               fontFamily: 'Montserrat',
                             ),
                           ),

                         ),
                         const SizedBox(height: 16.0), // Espaço entre os elementos
                         Container(
                           height: 280, // Defina a altura desejada aqui
                           decoration: BoxDecoration(
                             color: Colors.white, // Define a cor de fundo como branco
                             borderRadius: BorderRadius.circular(8.0), // Opcional: arredonda as bordas
                           ),
                           child: TextFormField(
                             style: TextStyle( fontFamily: 'Montserrat',),
                             decoration: const InputDecoration(
                               hintText: 'Escreva uma descrição para sua tarefa.',
                               hintStyle: TextStyle(color: const Color(0xFF909ba2)),

                               border: InputBorder.none, // Remove a borda padrão do TextFormField
                               contentPadding: EdgeInsets.symmetric(horizontal: 16.0),

                               // Adiciona preenchimento interno
                             ),


                           ),


                         ),
                         const SizedBox(height: 50.0),
                         Row(
                           mainAxisAlignment: MainAxisAlignment.spaceAround,
                           children: [
                             ElevatedButton(
                               onPressed: () {},
                               style: ElevatedButton.styleFrom(
                                 shape: const CircleBorder(),
                                 backgroundColor: const Color(0xFFfff2cc), // Corrigido para 0xFFF2CDCD
                                 padding: const EdgeInsets.all(15),
                               ),
                               child: const Text(''),
                             ),

                             ElevatedButton(
                               onPressed: () {},
                               style: ElevatedButton.styleFrom(
                                 shape: const CircleBorder(),
                                 backgroundColor: const Color(0xFFffd9f0), // Corrigido para 0xFFF2CDCD
                                 padding: const EdgeInsets.all(15),
                               ),
                               child: const Text(''),
                             ),

                             ElevatedButton(
                               onPressed: () {},
                               style: ElevatedButton.styleFrom(
                                 shape: const CircleBorder(),
                                 backgroundColor: const Color(0xFFe8c5ff), // Corrigido para o valor completo de 8 dígitos
                                 padding: const EdgeInsets.all(15),
                               ),
                               child: const Text(''),
                             ),

                             ElevatedButton(
                               onPressed: () {},
                               style: ElevatedButton.styleFrom(
                                 shape: const CircleBorder()
                                 , backgroundColor: Color(0xFFcafbff),
                                 padding: const EdgeInsets.all(15),
                               ),
                               child: const Text(''),
                             ),
                             ElevatedButton(
                               onPressed: () {},
                               style: ElevatedButton.styleFrom(
                                 shape: const CircleBorder(),
                                 backgroundColor: const Color(0xFFe3ffe6),
                                 padding: const EdgeInsets.all(15),
                               ),
                               child: const Text(''),
                             ),

                           ],
                         ),
                         const SizedBox(height: 120.0),
                         const Row(

                           mainAxisAlignment: MainAxisAlignment.spaceAround,
                           children: [
                             Icon(CupertinoIcons.clear_thick, color: Colors.white, size: 90), // Ícone de cancelar
                             SizedBox(width: 30), // Espaçamento entre os ícones
                             Icon(CupertinoIcons.checkmark_alt, color: Colors.white, size: 90), // Ícone de ok
                           ],
                         ),

                       ],
                     ),
                   )




                 ],
               ),
             ),

    ));
  }
}
