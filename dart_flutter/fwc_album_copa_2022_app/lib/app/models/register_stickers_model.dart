
import 'dart:convert';

class RegisterStickersModel {
  final String name;
  final String stickerCode;
  final String stickerNumber;
  RegisterStickersModel({
    required this.name,
    required this.stickerCode,
    required this.stickerNumber,
  });

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'sticker_code': stickerCode,
      'sticker_number': stickerNumber,
    };
  }

  factory RegisterStickersModel.fromMap(Map<String, dynamic> map) {
    return RegisterStickersModel(
      name: map['name'] ?? '',
      stickerCode: map['stickers_code'] ?? '',
      stickerNumber: map['stickers_number'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory RegisterStickersModel.fromJson(String source) =>
      RegisterStickersModel.fromMap(json.decode(source));
}
