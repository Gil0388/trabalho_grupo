import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:trabalho_grupo/data/model/todo_model.dart';
import 'package:trabalho_grupo/styles/styles.dart';

class AddTodoPage extends StatefulWidget {
  const AddTodoPage({Key? key}) : super(key: key);

  @override
  State<AddTodoPage> createState() => _AddTodoPageState();
}

class _AddTodoPageState extends State<AddTodoPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _tituloController = TextEditingController();
  final TextEditingController _descricaoController = TextEditingController();
  Color _selectedColor = Colors.white;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: pink,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              //padding: const EdgeInsets.symmetric(horizontal: 0.0, vertical: 0.0),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Container(
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
                        child: GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Align(
                            alignment: Alignment
                                .centerLeft, // Alinha o widget à esquerda
                            child: Image.asset(
                              'assets/images/lovepeople_logo.png',
                              height: 52,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 18.0),
                  Text(
                    'Adicionar Nota',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      TextFormField(
                        controller: _tituloController,
                        decoration: InputDecoration(
                          labelText: 'Título da Tarefa',
                          filled: true,
                          fillColor: Colors.white,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12.0),
                          ),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Por favor, insira um título';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 16.0),
                      TextFormField(
                        controller: _descricaoController,
                        maxLines: null, // Permitir múltiplas linhas
                        keyboardType: TextInputType.multiline, // Teclado para múltiplas linhas
                        decoration: InputDecoration(
                          labelText: 'Descrição',
                          filled: true,
                          fillColor: Colors.white,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12.0),
                          ),
                          contentPadding: EdgeInsets.symmetric(vertical: 90.0, horizontal: 12.0), // Ajuste de altura
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Por favor, insira uma descrição';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 16.0),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          _buildColorButton(yellowLight),
                          _buildColorButton(pinkLight),
                          _buildColorButton(purpleLight),
                          _buildColorButton(blueLight),
                          _buildColorButton(greenLight),
                        ],
                      ),
                      const SizedBox(height: 32.0),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          GestureDetector(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: const Icon(
                              CupertinoIcons.clear_thick,
                              color: Colors.white,
                              size: 56,
                            ),
                          ),
                          const SizedBox(width: 30),
                          GestureDetector(
                            onTap: () {
                              if (_formKey.currentState!.validate()) {
                                Navigator.pop(
                                  context,
                                  TodoModel(
                                    id: 0,
                                    titulo: _tituloController.text,
                                    descricao: _descricaoController.text,
                                    cores: _selectedColor,
                                  ),
                                );
                              }
                            },
                            child: const Icon(
                              CupertinoIcons.checkmark_alt,
                              color: Colors.white,
                              size: 56,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildColorButton(Color color) {
    return ElevatedButton(
      onPressed: () {
        setState(() {
          _selectedColor = color;
        });
      },
      style: ElevatedButton.styleFrom(
        shape: const CircleBorder(),
        backgroundColor: color,
        padding: const EdgeInsets.all(15),
        side: _selectedColor == color
            ? const BorderSide(color: Colors.black, width: 2)
            : BorderSide.none,
      ),
      child: const SizedBox.shrink(),
    );
  }
}
