import 'dart:typed_data';
import 'dart:developer';

import 'package:dio/dio.dart';

import '../../core/exceptions/repository_exception.dart';
import '../../core/rest_client/custom_dio.dart';
import '../../models/product/product_model.dart';

import './product_repository.dart';

class ProductRepositoryImpl implements ProductRepository {
  final CustomDio _dio;

  ProductRepositoryImpl(this._dio);

  @override
  Future<void> deleteProduct(int id) async {
    try {
      await _dio.auth().put(
        '/products/$id',
        data: {
          'enabled': false,
        },
      );
    } on DioError catch (e, s) {
      log('Erro ao deletar o produto', error: e, stackTrace: s);
      throw RepositoryException('Erro ao deletar o produto');
    }
  }

  @override
  Future<List<ProductModel>> findAll(String? name) async {
    try {
      final productResult = await _dio.auth().get(
        '/products',
        queryParameters: {
          if (name != null) 'name': name,
          'enabled': true,
        },
      );
      return productResult.data
          .map<ProductModel>((dynamic p) => ProductModel.fromMap(p))
          .toList();
    } on DioError catch (e, s) {
      log('Erro ao buscar os produtos', error: e, stackTrace: s);
      throw RepositoryException('Erro ao buscar os produtos');
    }
  }

  @override
  Future<ProductModel> getProduct(int id) async {
    try {
      final productResult = await _dio.auth().get(
            '/products/$id',
          );
      return ProductModel.fromMap(productResult.data);
    } on DioError catch (e, s) {
      log('Erro ao buscar os produtos', error: e, stackTrace: s);
      throw RepositoryException('Erro ao buscar os produtos');
    }
  }

  @override
  Future<void> save(ProductModel productModel) async {
    try {
      final client = _dio.auth();
      final data = productModel.toMap();
      if (productModel.id != null) {
        await client.put('/products/${productModel.id}', data: data);
      } else {
        await client.post('/products', data: data);
      }
    } on DioError catch (e, s) {
      log('Erro ao salvar produto', error: e, stackTrace: s);
      throw RepositoryException('Erro ao salvar produto');
    }
  }

  @override
  Future<String> uploadImageProduct(Uint8List file, String filename) async {
    try {
      final formData = FormData.fromMap(
        {
          'file': MultipartFile.fromBytes(file, filename: filename),
        },
      );
      final response = await _dio.auth().post('/uploads', data: formData);
      return response.data['url'];
    } on DioError catch (e, s) {
      log('Erro ao fazer upload do arquivo', error: e, stackTrace: s);
      throw RepositoryException('Erro ao fazer upload do arquivo');
    }
  }
}
