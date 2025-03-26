import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:watch_store/constant/endpoinst.dart';

var locator = GetIt.instance;

Future<void> getItInit() async {
  //Conponents
  locator.registerSingleton<SharedPreferences>(
    await SharedPreferences.getInstance(),
  );

  locator.registerSingleton<Dio>(Dio(BaseOptions(
    baseUrl: Endpoints.baseUrl,
  )));
}
