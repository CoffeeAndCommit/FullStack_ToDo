// ignore_for_file: public_member_api_docs, sort_constructors_first
class ToDo {
  int id;
  String title;
  String description;
  bool completed;
  String created_at;
  String? updated_at;
  ToDo({
    required this.id,
    required this.title,
    required this.description,
    required this.completed,
    required this.created_at,
    this.updated_at,
  });
}
