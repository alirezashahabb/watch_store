import 'package:watch_store/component/di.dart';
import 'package:watch_store/data/model/data_source/product_data_source.dart';
import 'package:watch_store/data/model/home_model.dart';

abstract class IProductRepositroy {
  Future<List<ProductModel>> getAllByCategory(int id);
  Future<List<ProductModel>> getAllByBrand(int id);
  Future<List<ProductModel>> getSoetrd(String routParam);
  Future<List<ProductModel>> getAllProduct(String searchKey);
}

class ProductRepostroy extends IProductRepositroy {
  final IProductDataSource productDataSource = locator.get();
  @override
  Future<List<ProductModel>> getAllByBrand(int id) async {
    return productDataSource.getAllByBrand(id);
  }

  @override
  Future<List<ProductModel>> getAllByCategory(int id) async {
    return productDataSource.getAllByCategory(id);
  }

  @override
  Future<List<ProductModel>> getAllProduct(String searchKey) async {
    return productDataSource.getAllProduct(searchKey);
  }

  @override
  Future<List<ProductModel>> getSoetrd(String routParam) async {
    return productDataSource.getSoetrd(routParam);
  }
}
