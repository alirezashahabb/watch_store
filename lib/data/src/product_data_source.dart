import 'package:dio/dio.dart';
import 'package:watch_store/data/constant/url_string.dart';
import 'package:watch_store/data/model/product.dart';
import 'package:watch_store/utils/response_validator.dart';

abstract class IProductDataSource {
  Future<List<ProductModel>> getAllByBrandId(int id);
  Future<List<ProductModel>> getAllByCategory(int id);
  Future<List<ProductModel>> getAllProductsBySearch(String search);
  Future<List<ProductModel>> getAllBrands();

  Future<List<ProductModel>> getAllNewestProducts();

  Future<List<ProductModel>> getAllCheapestProduct();
  Future<List<ProductModel>> getAllMostExpensive();
  Future<List<ProductModel>> getAllMostViewProducts();
}

class ProductDataSource implements IProductDataSource {
  final Dio _dio = Dio(BaseOptions(baseUrl: EndPoint.baseUrl));

  @override
  Future<List<ProductModel>> getAllByBrandId(int id) async {
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

  ///========================================================================>>>>>> for brand
  @override
  Future<List<ProductModel>> getAllBrands() async {
    List<ProductModel> product = [];
    Response response = await _dio.get('brands');
    HTTPResponseValidator.isValidStatusCode(response.statusCode!);

    for (var element in response.data['data'] as List) {
      product.add(ProductModel.fromJson(element));
    }

    return product;
  }

  ///========================================================================>>>>>> for CheapestProduct
  @override
  Future<List<ProductModel>> getAllCheapestProduct() async {
    List<ProductModel> product = [];
    Response response = await _dio.get('cheapest_products');
    HTTPResponseValidator.isValidStatusCode(response.statusCode!);

    for (var element in response.data['all_products']['data'] as List) {
      product.add(ProductModel.fromJson(element));
    }

    return product;
  }

  ///========================================================================>>>>>> for MostExpensive
  @override
  Future<List<ProductModel>> getAllMostExpensive() async {
    List<ProductModel> product = [];
    Response response = await _dio.get('most_expensive_products');
    HTTPResponseValidator.isValidStatusCode(response.statusCode!);

    for (var element in response.data['all_products']['data'] as List) {
      product.add(ProductModel.fromJson(element));
    }

    return product;
  }

  ///========================================================================>>>>>> for MostView
  @override
  Future<List<ProductModel>> getAllMostViewProducts() async {
    List<ProductModel> product = [];
    Response response = await _dio.get('most_viewed_products');
    HTTPResponseValidator.isValidStatusCode(response.statusCode!);

    for (var element in response.data['all_products']['data'] as List) {
      product.add(ProductModel.fromJson(element));
    }

    return product;
  }

  ///========================================================================>>>>>> for NewestProducts
  @override
  Future<List<ProductModel>> getAllNewestProducts() async {
    List<ProductModel> product = [];
    Response response = await _dio.get('/newest_products');
    HTTPResponseValidator.isValidStatusCode(response.statusCode!);

    for (var element in response.data['all_products']['data'] as List) {
      product.add(ProductModel.fromJson(element));
    }

    return product;
  }
}
