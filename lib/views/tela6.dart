import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:trabalho_grupo/widgets/cards_e_funcoes.dart';
import '../styles/styles.dart';

class SixthPage extends StatefulWidget {
  const SixthPage({super.key});

  @override
  State<SixthPage> createState() => _SixthPageState();
}

class _SixthPageState extends State<SixthPage> {
//! Controllers e key para guardar as informações.
  final TextEditingController tituloCtrll = TextEditingController();
  final TextEditingController descricaoCtrll = TextEditingController();
  final GlobalKey<FormState> _acesso = GlobalKey();

//! Variavel que guarda a cor do Card.
  Color? definirCor;

//! Metodo para limpar as informações.
  void resetInfo() {
    tituloCtrll.clear();
    descricaoCtrll.clear();
  }

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
                      bottomRight:
                          Radius.circular(100.0), // Define o raio desejado
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    // Ajuste o valor conforme necessário
//! Botão Navigator.pop na logo.
                    child: GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Align(
                        alignment:
                            Alignment.centerLeft, // Alinha o widget à esquerda
                        child: Image.asset(
                          'assets/images/lovepeople_logo.png',
                          height: 52,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                    height: 100,
                    width: 250.0,
                    child: Container(
                      padding: const EdgeInsets.only(
                          top: 50), // Ajuste o valor conforme necessário
                      alignment: Alignment.topCenter,
                      child: const Text(
                        'Nova Tarefa',
                        style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'Montserrat',
                            fontSize: 20),
                      ),
                    )),
              ],
            ),
            // FORMULARIO DE NOTAS
            Container(
              padding: const EdgeInsets.all(30),
              child: Form(
                key: _acesso,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                child: Column(
                  children: [
                    Container(
                      height: 40, // Defina a altura desejada aqui
                      decoration: BoxDecoration(
                        color:
                            Colors.white, // Define a cor de fundo como branco
                        borderRadius: BorderRadius.circular(
                            9.0), // Opcional: arredonda as bordas
                      ),
//! TextField titulo
                      child: TextFormField(
                        controller: tituloCtrll,
                        decoration: const InputDecoration(
                          errorBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.red)),
                          hintText: 'Título da Tarefa',
                          hintStyle: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Color(0xffa901f7)),
                          border: InputBorder
                              .none, // Remove a borda padrão do TextFormField
                          contentPadding: EdgeInsets.symmetric(
                              vertical: 10.0,
                              horizontal:
                                  16.0), // Adiciona preenchimento interno
                        ),
                        style: const TextStyle(
                          fontFamily: 'Montserrat',
                        ),
                      ),
                    ),
                    const SizedBox(height: 16.0), // Espaço entre os elementos
                    Container(
                      height: 280, // Defina a altura desejada aqui
                      decoration: BoxDecoration(
                        color:
                            Colors.white, // Define a cor de fundo como branco
                        borderRadius: BorderRadius.circular(
                            8.0), // Opcional: arredonda as bordas
                      ),
//! TextField descrição.
                      child: TextFormField(
                        controller: descricaoCtrll,
                        style: const TextStyle(
                          fontFamily: 'Montserrat',
                        ),
                        decoration: const InputDecoration(
                          hintText: 'Escreva uma descrição para sua tarefa.',
                          hintStyle: TextStyle(color: Color(0xFF909ba2)),

                          border: InputBorder
                              .none, // Remove a borda padrão do TextFormField
                          contentPadding:
                              EdgeInsets.symmetric(horizontal: 16.0),

                          // Adiciona preenchimento interno
                        ),
                      ),
                    ),
                    const SizedBox(height: 50.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            setState(() {
                              definirCor = yellowLight;
                            });
                          },
                          style: ElevatedButton.styleFrom(
                            shape: const CircleBorder(),
                            backgroundColor:
                                yellowLight, // Corrigido para 0xFFF2CDCD
                            padding: const EdgeInsets.all(15),
                          ),
                          child: const Text(''),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            setState(() {
                              definirCor = pinkLight;
                            });
                          },
                          style: ElevatedButton.styleFrom(
                            shape: const CircleBorder(),
                            backgroundColor:
                                pinkLight, // Corrigido para 0xFFF2CDCD
                            padding: const EdgeInsets.all(15),
                          ),
                          child: const Text(''),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            setState(() {
                              definirCor = purpleLight;
                            });
                          },
                          style: ElevatedButton.styleFrom(
                            shape: const CircleBorder(),
                            backgroundColor:
                                purpleLight, // Corrigido para o valor completo de 8 dígitos
                            padding: const EdgeInsets.all(15),
                          ),
                          child: const Text(''),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            setState(() {
                              definirCor = blueLight;
                            });
                          },
                          style: ElevatedButton.styleFrom(
                            shape: const CircleBorder(),
                            backgroundColor: blueLight,
                            padding: const EdgeInsets.all(15),
                          ),
                          child: const Text(''),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            setState(() {
                              definirCor = greenLight;
                            });
                          },
                          style: ElevatedButton.styleFrom(
                            shape: const CircleBorder(),
                            backgroundColor: greenLight,
                            padding: const EdgeInsets.all(15),
                          ),
                          child: const Text(''),
                        ),
                      ],
                    ),
                    const SizedBox(height: 120.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        GestureDetector(
                          onTap: () {
                            resetInfo();
                          },
                          child: const Icon(CupertinoIcons.clear_thick,
                              color: Colors.white, size: 90),
                        ), // Ícone de cancelar
                        const SizedBox(width: 30),
//! Botão que retorna com as informações para o card.
                        GestureDetector(
                          onTap: () {
                            if (_acesso.currentState!.validate()) {
                              Navigator.pop(
                                  context,
                                  Lista(
                                      titulo: tituloCtrll.text,
                                      descricao: descricaoCtrll.text,
                                      cores: definirCor));
                            }
                          },
                          child: const Icon(CupertinoIcons.checkmark_alt,
                              color: Colors.white, size: 90),
                        ),

                        // Ícone de ok
                      ],
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    ));
  }
}
