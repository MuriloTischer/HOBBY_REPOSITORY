import 'dart:developer';

import 'package:mobx/mobx.dart';

import '../../../models/product/product_model.dart';
import '../../../repositores/products/product_repository.dart';
part 'product_controller.g.dart';

enum ProductStateStatus {
  initial,
  loading,
  loaded,
  error,
  addOrUpdateProduct,
}

class ProductController = ProductControllerBase with _$ProductController;

abstract class ProductControllerBase with Store {
  final ProductRepository _productRepository;

  ProductControllerBase(this._productRepository);

  @readonly
  var _status = ProductStateStatus.initial;

  @readonly
  var _products = <ProductModel>[];

  @readonly
  String? _filterName;

  @readonly
  ProductModel? _productSelected;

  @action
  Future<void> loadProducts() async {
    try {
      _status = ProductStateStatus.loading;
      _products = await _productRepository.findAll(_filterName);
      _status = ProductStateStatus.loaded;
    } catch (e, s) {
      log('Erro ao carregar produtos', error: e, stackTrace: s);
      _status = ProductStateStatus.error;
    }
  }

  @action
  Future<void> filterByName(String name) async {
    _filterName = name;
    await loadProducts();
  }

  @action
  Future<void> addProduct() async {
    _status = ProductStateStatus.loading;
    await Future.delayed(Duration.zero);
    _productSelected = null;
    _status = ProductStateStatus.addOrUpdateProduct;
  }

  @action
  Future<void> editProduct(ProductModel productModel) async {
    _status = ProductStateStatus.loading;
    await Future.delayed(Duration.zero);
    _productSelected = productModel;
    _status = ProductStateStatus.addOrUpdateProduct;
  }
}
