// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'order_product_model.dart';
import 'order_status.dart';

class OrderModel {
  final int id;
  final DateTime date;
  final OrderStatus status;
  final List<OrderProductModel> orderProducts;
  final int userId;
  final String address;
  final String cpf;
  final int paymentTypeId;

  OrderModel(
    this.id,
    this.date,
    this.status,
    this.orderProducts,
    this.userId,
    this.address,
    this.cpf,
    this.paymentTypeId,
  );

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'date': date.toIso8601String(),
      'status': status.acronym,
      'orderProducts': orderProducts.map((x) => x.toMap()).toList(),
      'user_id': userId,
      'address': address,
      'cpf': cpf,
      'payment_method_id': paymentTypeId,
    };
  }

  factory OrderModel.fromMap(Map<String, dynamic> map) {
    return OrderModel(
      (map['id'] ?? 0) as int,
      DateTime.parse(map['date']),
      OrderStatus.parse(map['status']),
      List<OrderProductModel>.from(
        (map['products']).map<OrderProductModel>(
          (x) => OrderProductModel.fromMap(x as Map<String, dynamic>),
        ),
      ),
      (map['user_id'] ?? 0) as int,
      (map['address'] ?? '') as String,
      (map['cpf'] ?? '') as String,
      (map['payment_method_id'] ?? 0) as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory OrderModel.fromJson(String source) =>
      OrderModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
