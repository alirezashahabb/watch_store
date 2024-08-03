import 'package:dio/dio.dart';
import 'package:watch_store/data/constant/url_string.dart';
import 'package:watch_store/data/model/product.dart';
import 'package:watch_store/utils/response_validator.dart';

abstract class IProductDataSource {
  Future<List<ProductModel>> getAllByBrand(int id);
  Future<List<ProductModel>> getAllByCategory(int id);
  Future<List<ProductModel>> getAllProductsBySearch(String search);
}

class ProductDataSource implements IProductDataSource {
  final Dio _dio = Dio(BaseOptions(baseUrl: EndPoint.baseUrl));

  @override
  Future<List<ProductModel>> getAllByBrand(int id) async {
    List<ProductModel> product = [];
    Response response = await _dio.get(
      'products_by_brand',
      queryParameters: {
        'id': id,
      },
    );
    HTTPResponseValidator.isValidStatusCode(response.statusCode!);

    for (var element in response.data['data'] as List) {
      product.add(ProductModel.fromJson(element));
    }

    return product;
  }

  ///========================================================================>>>>>> for category
  @override
  Future<List<ProductModel>> getAllByCategory(int id) async {
    List<ProductModel> product = [];
    Response response = await _dio.get(
      'products_by_category',
      queryParameters: {
        'id': id,
      },
    );
    HTTPResponseValidator.isValidStatusCode(response.statusCode!);

    for (var element in response.data['data'] as List) {
      product.add(ProductModel.fromJson(element));
    }

    return product;
  }

  ///========================================================================>>>>>> for Search
  @override
  Future<List<ProductModel>> getAllProductsBySearch(String search) async {
    List<ProductModel> product = [];
    Response response = await _dio.get(
      'all_products',
      queryParameters: {
        'search': search,
      },
    );
    HTTPResponseValidator.isValidStatusCode(response.statusCode!);

    for (var element in response.data['data'] as List) {
      product.add(ProductModel.fromJson(element));
    }

    return product;
  }
}
