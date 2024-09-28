import 'package:dio/dio.dart';
import 'package:watch_store/data/model/home.dart';
import 'package:watch_store/data/src/home_data_source.dart';

abstract class IHomeRepository {
  Future<HomeModel> getHome();
}

class HomeRepository implements IHomeRepository {
  final IHomeDataSource _dataSource;

  HomeRepository(this._dataSource);
  @override
  Future<HomeModel> getHome() => _dataSource.getHome();
}

final homerepo = HomeRepository(HomeRemoteDataSource(httpClient: Dio()));
