import 'package:flutter_modular/flutter_modular.dart';

import '../../repositores/products/product_repository_impl.dart';
import 'detail/product_detail_controller.dart';
import 'detail/product_detail_page.dart';
import 'home/product_controller.dart';
import 'home/product_page.dart';

class ProductModule extends Module {
  @override
  List<Bind> get binds => [
        Bind.lazySingleton(
          (i) => ProductRepositoryImpl(i()),
        ),
        Bind.lazySingleton(
          (i) => ProductController(i()),
        ),
        Bind.lazySingleton(
          (i) => ProductDetailController(i()),
        ),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute('/', child: (context, args) => const ProductPage()),
        ChildRoute(
          '/detail',
          child: (context, args) => ProductDetailPage(
            productId: int.tryParse(args.queryParams['id'] ?? 'não informado'),
          ),
        ),
      ];
}
