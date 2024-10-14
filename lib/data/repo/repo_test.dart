import 'package:dio/dio.dart';
import 'package:watch_store/data/repo/product_repo.dart';
import 'package:watch_store/data/src/product_data_source.dart';

class RepoTest {
  final productRepo = ProductRepository(ProductRemoteDataSource(Dio()));

  getData() async => await productRepo.getProductDetail(3);
}
