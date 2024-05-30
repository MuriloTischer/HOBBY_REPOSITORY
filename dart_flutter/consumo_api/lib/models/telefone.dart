import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class Telefone {
  int ddd;
  String telefone;
  Telefone({
    required this.ddd,
    required this.telefone,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'ddd': ddd,
      'telefone': telefone,
    };
  }

  factory Telefone.fromMap(Map<String, dynamic> map) {
    return Telefone(
      ddd: map['ddd'] ?? 0,
      telefone: map['telefone'] ?? '' ,
    );
  }

  String toJson() => jsonEncode(toMap());

  factory Telefone.fromJson(String json) => Telefone.fromMap(jsonDecode(json));

  @override
  String toString() => 'Telefone(ddd: $ddd, telefone: $telefone)';
}
