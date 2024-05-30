import 'dart:convert';

import 'package:fwc_album_copa_2022_app/app/models/user_stickers_model.dart';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class GroupStickers {
  final int id;
  final String countryCode;
  final String countryName;
  final int stickerStart;
  final int stickerEnd;
  final List<UserStickerModel> stickers;
  final String flag;
  GroupStickers({
    required this.id,
    required this.countryCode,
    required this.countryName,
    required this.stickerStart,
    required this.stickerEnd,
    required this.stickers,
    required this.flag,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'country_code': countryCode,
      'country_name': countryName,
      'stickers_start': stickerStart,
      'stickers_end': stickerEnd,
      'stickers': stickers.map((x) => x.toMap()).toList(),
      'flag': flag,
    };
  }

  factory GroupStickers.fromMap(Map<String, dynamic> map) {
    return GroupStickers(
      //id: map['id'] as int,
      id: map['id']?.toInt() ?? 0,
      //countryCode: map['country_code'] as String,
       countryCode: map['country_code'] ?? '',
      //countryName: map['country_name'] as String,
      countryName: map['country_name'] ?? '',
      //stickersStart: map['stickers_start'] as int,
      stickerStart: map['sticker_start']?.toInt() ?? 0,
      //stickersEnd: map['stickers_end'] as int,
      stickerEnd: map['sticker_end']?.toInt() ?? 0,
     
      // stickers: List<UserStickersModel>.from(
      //   (map['stickers'] as List<int>).map<UserStickersModel>((x) => UserStickersModel.fromMap(x as Map<String,dynamic>),),),
      // flag: map['flag'] as String,
      stickers: List<UserStickerModel>.from(
          map['stickers']?.map((x) => UserStickerModel.fromMap(x)) ?? const []),
      flag: map['flag'] ?? '',


    );
  }

  String toJson() => json.encode(toMap());

  factory GroupStickers.fromJson(String source) => GroupStickers.fromMap(json.decode(source));// as Map<String, dynamic>);
}
