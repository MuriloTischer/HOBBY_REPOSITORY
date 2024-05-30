import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class UserStickerModel {
  final int id;
  final int idUser;
  final int idStickers;
  final int duplicated;
  final String stickerCode;
  final String stickerNumber;
  UserStickerModel({
    required this.id,
    required this.idUser,
    required this.idStickers,
    required this.duplicated,
    required this.stickerCode,
    required this.stickerNumber,
  });


  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'id_user': idUser,
      'id_stickers': idStickers,
      'duplicated': duplicated,
      'stickers_code': stickerCode,
      'stickers_number': stickerNumber,
    };
  }

  factory UserStickerModel.fromMap(Map<String, dynamic> map) {
    return UserStickerModel(
      // id: map['id'] as int,
      // idUser: map['id_user'] as int,
      // idStickers: map['id_sticker'] as int,
      // duplicated: map['duplicated'] as int,
      // stickersCode: map['stickers_code'] as String,
      // stickersNumber: map['stickers_number'] as String,
 id: map['id']?.toInt() ?? 0,
      idUser: map['id_user']?.toInt() ?? 0,
      idStickers: map['id_sticker']?.toInt() ?? 0,
      duplicated: map['duplicate_stickers']?.toInt() ?? 0,
      stickerCode: map['sticker_code'] ?? '',
      stickerNumber: map['sticker_number'] ?? '',

    );
  }

  String toJson() => json.encode(toMap());

  factory UserStickerModel.fromJson(String source) => UserStickerModel.fromMap(json.decode(source)); // as Map<String, dynamic>);
}
