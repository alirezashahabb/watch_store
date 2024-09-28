import 'package:dio/dio.dart';
import 'package:watch_store/data/constant/url_string.dart';
import 'package:watch_store/data/model/home.dart';
import 'package:watch_store/utils/response_validator.dart';

abstract class IHomeDataSource {
  Future<HomeModel> getHome();
}

class HomeRemoteDataSource implements IHomeDataSource {
  final Dio httpClient;

  HomeRemoteDataSource({required this.httpClient});
  @override
  Future<HomeModel> getHome() async {
    final HomeModel home;
    Response response = await httpClient.get(Endpoints.home);

    HTTPResponseValidator.isValidStatusCode(response.statusCode ?? 0);

    home = HomeModel.fromJson(response.data['data']);

    return home;
  }
}
