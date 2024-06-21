
import 'package:flutter/material.dart';

class TodoResponse {
  final List<TodoModel> todoListAPI;

  TodoResponse({required this.todoListAPI});
  factory TodoResponse.fromMap(Map<String, dynamic> map) {
    final data = map['data'] as List;

    List<TodoModel> temporaryList = [];
    for (int index = 0; index < data.length; index++) {
      final values = data[index]['attributes'];
      String hexColor = values['color'];
      Color color =
          Color(int.parse(hexColor.substring(1, 7), radix: 16) + 0xFF000000);
      temporaryList.add(
        TodoModel(
          id: data[index]['id'],
          titulo: values['title'],
          descricao: values['description'],
          cores: color,
        ),
      );
    }
    return TodoResponse(todoListAPI: temporaryList);
  }
}

class TodoModel {
  int id;
  String titulo;
  String descricao;
  Color? cores;

  TodoModel({
    required this.titulo,
    required this.descricao,
    required this.cores,
    required this.id
  });

factory TodoModel.fromJson(Map<String, dynamic> json) {
    return TodoModel(
      id: json['id'],
      titulo: json['title'],
      descricao: json['description'],
      cores: json['color'],
    );
  }

  // static String encode(List<Lista> listagem) {
  //   List<Map<String, dynamic>> mapList = listagem
  //       .map((item) => {
  //             'titulo': item.titulo,
  //             'descricao': item.descricao,
  //             'cores': item.cores?.value,
  //           })
  //       .toList();
  //   return json.encode(mapList);
  // }

  // static List<Lista> decode(String listagemString) {
  //   List<dynamic> mapList = json.decode(listagemString);
  //   return mapList.map((item) {
  //     return Lista(
  //       id: item['id'],
  //       titulo: item['titulo'],
  //       descricao: item['descricao'],
  //       cores: item['cores'] != null ? Color(item['cores']) : null,
  //     );
  //   }).toList();
  // }
}
