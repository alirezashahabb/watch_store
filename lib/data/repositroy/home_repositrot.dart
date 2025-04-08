import 'package:watch_store/component/di.dart';
import 'package:watch_store/data/data_source/home_data_source.dart';
import 'package:watch_store/data/model/home_model.dart';

abstract class IHomeRepo {
  Future<HomeModel> getHome();
}

class HomeRepository implements IHomeRepo {
  final IHomeDataSrc _homeDataSrc = locator.get();

  HomeRepository();

  @override
  Future<HomeModel> getHome() => _homeDataSrc.getHome();
}
