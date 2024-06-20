class TodoModel {
  final int id;
  final String title;
  final String description;

  TodoModel({
    required this.id,
    required this.title,
    required this.description,
  });

  factory TodoModel.fromJson(Map<String, dynamic> json) {
    return TodoModel(
      id: json['id'],
      title: json['attributes']['title'],
      description: json['attributes']['description'],
    );
  }
}
