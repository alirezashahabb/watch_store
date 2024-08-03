import 'package:watch_store/data/model/product.dart';
import 'package:watch_store/data/src/product_data_source.dart';

abstract class IProductRepo {
  Future<List<ProductModel>> getAllByBrandId(int id);
  Future<List<ProductModel>> getAllByCategory(int id);
  Future<List<ProductModel>> getAllProductsBySearch(String search);
  Future<List<ProductModel>> getAllBrands();

  Future<List<ProductModel>> getAllNewestProducts();

  Future<List<ProductModel>> getAllCheapestProduct();
  Future<List<ProductModel>> getAllMostExpensive();
  Future<List<ProductModel>> getAllMostViewProducts();
}

class ProductRepo implements IProductRepo {
  final ProductDataSource _dataSource;

  ProductRepo(this._dataSource);

  @override
  Future<List<ProductModel>> getAllBrands() {
    return _dataSource.getAllBrands();
  }

  @override
  Future<List<ProductModel>> getAllByBrandId(int id) {
    return _dataSource.getAllByBrandId(id);
  }

  @override
  Future<List<ProductModel>> getAllByCategory(int id) {
    return _dataSource.getAllByCategory(id);
  }

  @override
  Future<List<ProductModel>> getAllCheapestProduct() {
    return _dataSource.getAllCheapestProduct();
  }

  @override
  Future<List<ProductModel>> getAllMostExpensive() {
    return _dataSource.getAllMostExpensive();
  }

  @override
  Future<List<ProductModel>> getAllMostViewProducts() {
    return _dataSource.getAllMostViewProducts();
  }

  @override
  Future<List<ProductModel>> getAllNewestProducts() {
    return _dataSource.getAllNewestProducts();
  }

  @override
  Future<List<ProductModel>> getAllProductsBySearch(String search) {
    return getAllProductsBySearch(search);
  }
}
