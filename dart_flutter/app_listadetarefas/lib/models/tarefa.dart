// ignore_for_file: public_member_api_docs, sort_constructors_first
class Tarefa {
  String title;
  DateTime dateTime;
  Tarefa({
    required this.title,
    required this.dateTime,
  });

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'datetime': dateTime.toIso8601String(),
    };
  }

  Tarefa.fromJson(Map<String, dynamic> json)
      : title = json['title'],
        dateTime = DateTime.parse(json['datetime']);
}
