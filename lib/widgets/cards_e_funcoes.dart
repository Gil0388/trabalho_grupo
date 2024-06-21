
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


