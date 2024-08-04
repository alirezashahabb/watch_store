import 'package:watch_store/data/model/home.dart';
import 'package:watch_store/data/src/home_data_source.dart';

abstract class IHomeRepo {
  Future<HomeModel> getHome();
}

class HomeRepo implements IHomeRepo {
  final IHomeDataSource _dataSource;

  HomeRepo(this._dataSource);
  @override
  Future<HomeModel> getHome() => _dataSource.getHome();
}
