import 'package:greengrocer_app/src/models/cart_item_model.dart';
import 'package:greengrocer_app/src/models/item_model.dart';
import 'package:greengrocer_app/src/models/order_model.dart';
import 'package:greengrocer_app/src/models/user_model.dart';

ItemModel apple = ItemModel(
  imgUrl: 'assets/fruits/apple.png',
  itemName: 'Maça',
  price: 5.5,
  unit: 'Kg',
  description:
      'A melhor maça da região e que conta com o melhor preço de qualquer quitanda. Este item conta com vitaminas essenciais para o fortalecimento corporal, resultando em uma vida saudável.',
);

ItemModel grape = ItemModel(
  imgUrl: 'assets/fruits/grape.png',
  itemName: 'Uva',
  price: 7.4,
  unit: 'kg',
  description:
      'A melhor uva da região e que conta com o melhor preço de qualquer quitanda. Este item conta com vitaminas essenciais para o fortalecimento corporal, resultando em uma vida saudável.',
);

ItemModel guava = ItemModel(
  imgUrl: 'assets/fruits/guava.png',
  itemName: 'Goiaba',
  price: 11.5,
  unit: 'kg',
  description:
      'A melhor goiaba da região e que conta com o melhor preço de qualquer quitanda. Este item conta com vitaminas essenciais para o fortalecimento corporal, resultando em uma vida saudável.',
);

ItemModel kiwi = ItemModel(
  imgUrl: 'assets/fruits/kiwi.png',
  itemName: 'Kiwi',
  price: 2.5,
  unit: 'un',
  description:
      'O melhor kiwi da região e que conta com o melhor preço de qualquer quitanda. Este item conta com vitaminas essenciais para o fortalecimento corporal, resultando em uma vida saudável.',
);

ItemModel manga = ItemModel(
  imgUrl: 'assets/fruits/manga.png',
  itemName: 'Manga',
  price: 2.5,
  unit: 'un',
  description:
      'A melhor manga da região e que conta com o melhor preço de qualquer quitanda. Este item conta com vitaminas essenciais para o fortalecimento corporal, resultando em uma vida saudável.',
);

ItemModel papaya = ItemModel(
  imgUrl: 'assets/fruits/papaya.png',
  itemName: 'Mamão papaya',
  price: 8,
  unit: 'kg',
  description:
      'O melhor mamão da região e que conta com o melhor preço de qualquer quitanda. Este item conta com vitaminas essenciais para o fortalecimento corporal, resultando em uma vida saudável.',
);

//! Lista de produtos
List<ItemModel> items = [
  apple,
  grape,
  guava,
  kiwi,
  manga,
  papaya,
];

List<String> categories = [
  'Frutas',
  'Grãos',
  'Verduras',
  'Temperos',
  'Cereais',
];

List<CartItemModel> cartItems = [
  CartItemModel(
    item: apple,
    quantity: 2,
  ),
  CartItemModel(
    item: grape,
    quantity: 1,
  ),
  CartItemModel(
    item: guava,
    quantity: 3,
  ),
  CartItemModel(
    item: kiwi,
    quantity: 1,
  ),
  CartItemModel(
    item: manga,
    quantity: 2,
  ),
  CartItemModel(
    item: papaya,
    quantity: 3,
  ),
];

UserModel user = UserModel(
    name: 'Murilo Tischer',
    email: 'murilo@email.com',
    phone: '99 9.9999-9999',
    cpf: '999.999.999-99',
    password: '');

List<OrderModel> orders = [
  //! Pedido 01
  OrderModel(
    copyAndPast: 'q1w2e3r4t5y6',
    createdDateTime: DateTime.parse(
      '2024-01-14 15:54:36.458',
    ),
    overdueDateTime: DateTime.parse(
      '2024-01-14 16:54:36.458',
    ),
    id: 'stringQualquerDeTest',
    status: 'pending_payment',
    total: 11.0,
    items: [
      CartItemModel(
        item: apple,
        quantity: 2,
      ), 
      CartItemModel(
        item: manga,
        quantity: 3,
      ),
    ],
  ),

//! Pedido 02
  OrderModel(
    copyAndPast: 'q1w2e3r4t5y6',
    createdDateTime: DateTime.parse(
      '2024-01-14 10:00:10.458',
    ),
    overdueDateTime: DateTime.parse(
      '2024-01-14 11:00:10.458',
    ),
    id: 'a65s4d6a2s1d6a5s',
    status: 'delivered',
    total: 11.5,
    items: [
      CartItemModel(
        item: guava,
        quantity: 1,
      ),
    ],
  ),
];