import 'package:flutter/material.dart';
import 'package:trabalho_grupo/styles/styles.dart';

class Cards extends StatelessWidget {
  final String title;
  final String subtitle;
  final Color? color;
  final Function deletar;

  const Cards({
    super.key,
    required this.title,
    required this.subtitle,
    required this.color,
    required this.deletar,
  });

  @override
  Widget build(BuildContext context) {
//! Layout para gerar o card.
    return Card(
      color: color,
      child: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ListTile(
                title: Text(
                  title,
                  style: const TextStyle(color: purple),
                ),
                subtitle: Text(
                  subtitle,
                  style: const TextStyle(color: purple),
                ),
              ),
            ],
          ),
//! Icone do card.
          Positioned(
            top: 4,
            right: 4,
            child: IconButton(
              icon: const Icon(Icons.delete_outline_sharp),
              onPressed: () {
                confirmarExclusao(context);
              },
            ),
          ),
        ],
      ),
    );
  }

//! Metodo do Alert para confirmar a exclusão do card
  void confirmarExclusao(BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return Dialog(
            backgroundColor: pinkTranparent,
            insetPadding: EdgeInsets.zero,
            child: AlertDialog(
              insetPadding: const EdgeInsets.symmetric(horizontal: 35),
              title: const Text(
                'Deseja deletar este item?',
                style: TextStyle(
                  color: purple,
                  fontFamily: 'Montserrat',
                ),
              ),
              content: SizedBox(
                width: double.maxFinite,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        '"$title" será movido para lixeira!.',
                        textAlign: TextAlign.left,
                        style: const TextStyle(
                          color: purple,
                          fontFamily: 'Montserrat',
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        GestureDetector(
                            onTap: () {
                              deletar();
                              Navigator.pop(context);
                            },
                            child: const Text('Confirmar',
                                style: TextStyle(
                                  color: purple,
                                  fontFamily: 'Montserrat',
                                ))),
                        const SizedBox(
                          width: 30,
                        ),
                        GestureDetector(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: const Text('Cancelar',
                                style: TextStyle(
                                  color: pink,
                                  fontFamily: 'Montserrat',
                                ))),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        });
  }
}

//! Classe com contrutor necessario para guardar as informações do card.
class Lista {
  String titulo;
  String descricao;
  Color? cores;

  Lista({
    required this.titulo,
    required this.descricao,
    required this.cores,
  });
}
