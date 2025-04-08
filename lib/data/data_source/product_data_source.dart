import 'package:dio/dio.dart';
import 'package:watch_store/component/di.dart';
import 'package:watch_store/constant/endpoinst.dart';
import 'package:watch_store/data/model/product_model.dart';
import 'package:watch_store/utils/response_validator.dart';

abstract class IProductDataSource {
  Future<List<ProductModel>> getAllByCategory(int id);
  Future<List<ProductModel>> getAllByBrand(int id);
  Future<List<ProductModel>> getSoetrd(String routParam);
  Future<List<ProductModel>> getAllProduct(String searchKey);
}

class ProductDataSource extends IProductDataSource {
  final Dio httpClinet = locator.get();
  @override
  Future<List<ProductModel>> getAllByBrand(int id) async {
    List<ProductModel> products = [];

    Response response =
        await httpClinet.get(Endpoints.productsByBrand + id.toString());

    HTTPResponseValidator.isValidStatusCode(response.statusCode!);

    for (var element in response.data['all_products']['data'] as List) {
      products.add(ProductModel.fromJson(element));
    }

    return products;
  }

  @override
  Future<List<ProductModel>> getAllByCategory(int id) async {
    List<ProductModel> products = [];

    Response response =
        await httpClinet.get(Endpoints.productsByCategory + id.toString());

    HTTPResponseValidator.isValidStatusCode(response.statusCode!);

    for (var element in response.data['all_products']['data'] as List) {
      products.add(ProductModel.fromJson(element));
    }

    return products;
  }

  @override
  Future<List<ProductModel>> getAllProduct(String searchKey) async {
    List<ProductModel> products = [];

    Response response =
        await httpClinet.get(Endpoints.baseUrl + searchKey.toString());

    HTTPResponseValidator.isValidStatusCode(response.statusCode!);

    for (var element in response.data['all_products']['data'] as List) {
      products.add(ProductModel.fromJson(element));
    }

    return products;
  }

  @override
  Future<List<ProductModel>> getSoetrd(String routParam) async {
    List<ProductModel> products = [];

    Response response = await httpClinet.get(Endpoints.baseUrl + routParam);

    HTTPResponseValidator.isValidStatusCode(response.statusCode!);

    for (var element in response.data['all_products']['data'] as List) {
      products.add(ProductModel.fromJson(element));
    }

    return products;
  }
}
