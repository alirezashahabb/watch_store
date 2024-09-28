import 'package:dio/dio.dart';
import 'package:watch_store/data/repo/home_repo.dart';
import 'package:watch_store/data/src/home_data_source.dart';

class RepoTest {
  final homerepo = HomeRepository(HomeRemoteDataSource(httpClient: Dio()));

  getData() async => await homerepo.getHome();
}
