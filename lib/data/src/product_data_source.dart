import 'package:dio/dio.dart';
import 'package:watch_store/data/constant/url_string.dart';
import 'package:watch_store/data/model/product.dart';
import 'package:watch_store/data/model/product_detail.dart';
import 'package:watch_store/utils/response_validator.dart';

abstract class IProductDataSource {
  Future<List<ProductModel>> getAllByBrandId(int id);
  Future<ProductDetailsModel> getProductDetail(int id);
  Future<List<ProductModel>> getAllByCategory(int id);
  Future<List<ProductModel>> getAllBySorted(String routeParam);
  Future<List<ProductModel>> getAllProductsBySearch(String search);
}

class ProductRemoteDataSource implements IProductDataSource {
  final Dio httpClient;

  ProductRemoteDataSource(this.httpClient);
  @override
  Future<List<ProductModel>> getAllByBrandId(int id) async {
    List<ProductModel> products = [];
    Response response =
        await httpClient.get(Endpoints.productsByBrand + id.toString());
    HTTPResponseValidator.isValidStatusCode(response.statusCode ?? 0);
    for (var element in (response.data)[['all_products']]['data'] as List) {
      products.add(ProductModel.fromJson(element));
    }
    return products;
  }

  @override
  Future<List<ProductModel>> getAllByCategory(int id) async {
    List<ProductModel> products = [];
    Response response =
        await httpClient.get(Endpoints.productsByCategory + id.toString());
    HTTPResponseValidator.isValidStatusCode(response.statusCode ?? 0);
    for (var element
        in (response.data)[['products_by_category']]['data'] as List) {
      products.add(ProductModel.fromJson(element));
    }
    return products;
  }

  @override
  Future<List<ProductModel>> getAllBySorted(String routeParam) async {
    List<ProductModel> products = [];
    Response response = await httpClient.get(Endpoints.baseUrl + routeParam);
    HTTPResponseValidator.isValidStatusCode(response.statusCode ?? 0);

    for (var element in (response.data)['all_products']['data'] as List) {
      products.add(ProductModel.fromJson(element));
    }
    return products;
  }

  @override
  Future<List<ProductModel>> getAllProductsBySearch(String searchTerm) async {
    List<ProductModel> products = [];
    Response response = await httpClient.get(Endpoints.search + searchTerm);
    HTTPResponseValidator.isValidStatusCode(response.statusCode ?? 0);
    for (var element in (response.data)[['all_products']]['data'] as List) {
      products.add(ProductModel.fromJson(element));
    }
    return products;
  }

  @override
  Future<ProductDetailsModel> getProductDetail(int id) async {
    final response =
        await httpClient.get(Endpoints.productDetails + id.toString());
    HTTPResponseValidator.isValidStatusCode(response.statusCode ?? 0);
    return ProductDetailsModel.fromJson(response.data['data'][0]);
  }
}
