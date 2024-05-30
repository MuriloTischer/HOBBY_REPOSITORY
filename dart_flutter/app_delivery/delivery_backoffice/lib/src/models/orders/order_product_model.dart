// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class OrderProductModel {
  final int productId;
  final int amount;
  final double totalPrice;

  OrderProductModel(
    this.productId,
    this.amount,
    this.totalPrice,
  );

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': productId,
      'amount': amount,
      'total_price': totalPrice,
    };
  }

  factory OrderProductModel.fromMap(Map<String, dynamic> map) {
    return OrderProductModel(
      map['id'] as int,
      map['amount'] as int,
      map['total_price'] as double,
    );
  }

  String toJson() => json.encode(toMap());

  factory OrderProductModel.fromJson(String source) =>
      OrderProductModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
