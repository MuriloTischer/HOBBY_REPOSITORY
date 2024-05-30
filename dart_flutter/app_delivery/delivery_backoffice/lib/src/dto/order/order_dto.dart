import '../../models/orders/order_status.dart';
import '../../models/user/user_model.dart';
import '../../models/payment_type/payment_type_model.dart';
import 'order_product_dto.dart';

class OrderDto {
  final int id;
  final DateTime date;
  final OrderStatus status;
  final List<OrderProductDto> orderProducts;
  final UserModel user;
  final String address;
  final String cpf;
  final PaymentTypeModel paymentTypeModel;

  OrderDto(
    this.id,
    this.date,
    this.status,
    this.orderProducts,
    this.user,
    this.address,
    this.cpf,
    this.paymentTypeModel,
  );
}
