import 'dart:convert';
import 'package:flutter/material.dart';

class Cards extends StatelessWidget {
  final String title;
  final String subtitle;
  final Color? color;
  final VoidCallback deletar;

  const Cards({
    super.key,
    required this.title,
    required this.subtitle,
    required this.color,
    required this.deletar,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: color,
      child: ListTile(
        title: Text(title),
        subtitle: Text(subtitle),
        trailing: IconButton(
          icon: const Icon(Icons.delete),
          onPressed: () {
            _showDeleteConfirmationDialog(context);
          },
        ),
      ),
    );
  }

  void _showDeleteConfirmationDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Deseja deletar este item?'),
          content: Text("\"$title\" será removido para a lixeira."),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text("Cancelar"),
            ),
            TextButton(
              onPressed: () {
                deletar();
                Navigator.of(context).pop();
              },
              child: const Text("Confirmar"),
            ),
          ],
        );
      },
    );
  }
}

class Lista {
  String titulo;
  String descricao;
  Color? cores;

  Lista({
    required this.titulo,
    required this.descricao,
    required this.cores,
  });

  static String encode(List<Lista> listagem) {
    List<Map<String, dynamic>> mapList = listagem
        .map((item) => {
              'titulo': item.titulo,
              'descricao': item.descricao,
              'cores': item.cores?.value,
            })
        .toList();
    return json.encode(mapList);
  }

  static List<Lista> decode(String listagemString) {
    List<dynamic> mapList = json.decode(listagemString);
    return mapList.map((item) {
      return Lista(
        titulo: item['titulo'],
        descricao: item['descricao'],
        cores: item['cores'] != null ? Color(item['cores']) : null,
      );
    }).toList();
  }
}

