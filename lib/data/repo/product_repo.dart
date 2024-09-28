import 'package:watch_store/data/model/product.dart';
import 'package:watch_store/data/src/product_data_source.dart';

abstract class IProductRepo {
  Future<List<ProductModel>> getAllByBrandId(int id);
  Future<List<ProductModel>> getAllByCategory(int id);
  Future<List<ProductModel>> getAllBySorted(String routeParam);
  Future<List<ProductModel>> getAllProductsBySearch(String search);
}

class ProductRepository implements IProductRepo {
  final IProductDataSource _dataSource;

  ProductRepository(this._dataSource);
  @override
  Future<List<ProductModel>> getAllByBrandId(int id) {
    return _dataSource.getAllByBrandId(id);
  }

  @override
  Future<List<ProductModel>> getAllByCategory(int id) {
    return _dataSource.getAllByCategory(id);
  }

  @override
  Future<List<ProductModel>> getAllBySorted(String routeParam) {
    return _dataSource.getAllBySorted(routeParam);
  }

  @override
  Future<List<ProductModel>> getAllProductsBySearch(String search) {
    return _dataSource.getAllProductsBySearch(search);
  }
}
