class Task {
  int id;
  String title;
  String? description;

  Task({
    required this.id,
    required this.title,
    this.description
  });

  Task.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        title = json['title'],
        description = json['description'];
}
