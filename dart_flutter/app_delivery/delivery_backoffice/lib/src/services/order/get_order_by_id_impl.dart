import '../../dto/order/order_dto.dart';
import '../../dto/order/order_product_dto.dart';
import '../../models/orders/order_model.dart';
import '../../models/user/user_model.dart';
import '../../models/payment_type/payment_type_model.dart';
import '../../repositores/payment_type/payment_type_repository.dart';
import '../../repositores/products/product_repository.dart';
import '../../repositores/user/user_repository.dart';
import 'get_order_by_id.dart';

class GetOrderByIdImpl implements GetOrderById {
  final PaymentTypeRepository _paymentTypeRepository;
  final UserRepository _userRepository;
  final ProductRepository _productRepository;

  GetOrderByIdImpl(
    this._paymentTypeRepository,
    this._userRepository,
    this._productRepository,
  );

  @override
  Future<OrderDto> call(OrderModel order) => _orderDtoParse(order);

  @override
  Future<OrderDto> _orderDtoParse(OrderModel order) async {
    final paymentTypeFuture =
        _paymentTypeRepository.getById(order.paymentTypeId);
    final userFuture = _userRepository.getById(order.userId);
    final orderProductsFuture = _orderProductParse(order);

    final responses =
        await Future.wait([paymentTypeFuture, userFuture, orderProductsFuture]);
    return OrderDto(
      order.id,
      order.date,
      order.status,
      responses[2] as List<OrderProductDto>,
      responses[1] as UserModel,
      order.address,
      order.cpf,
      responses[0] as PaymentTypeModel,
    );
  }

  Future<List<OrderProductDto>> _orderProductParse(OrderModel order) async {
    final orderProducts = <OrderProductDto>[];
    final productsFuture = order.orderProducts
        .map((e) => _productRepository.getProduct(e.productId))
        .toList();

    final products = await Future.wait(productsFuture);

    for (var i = 0; i < order.orderProducts.length; i++) {
      final orderProduct = order.orderProducts[i];
      final productDto = OrderProductDto(
        product: products[i],
        amount: orderProduct.amount,
        totalPrice: orderProduct.totalPrice,
      );
      orderProducts.add(productDto);
    }
    return orderProducts;
  }
}
