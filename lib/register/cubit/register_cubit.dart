import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter_osm_plugin/flutter_osm_plugin.dart';
import 'package:meta/meta.dart';
import 'package:watch_store/component/di.dart';
import 'package:watch_store/constant/endpoinst.dart';
import 'package:watch_store/constant/share_prefance_constant.dart';
import 'package:watch_store/data/model/user.dart';
import 'package:watch_store/utils/share_prefance_manger.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit() : super(RegisterInitial());
  final Dio _dio = locator.get();

  pickTheLocation({required context}) async {
    await showSimplePickerLocation(
            isDismissible: true,
            title: "انتخاب موقعیت مکانی",
            textCancelPicker: "لغو",
            textConfirmPicker: "انتخاب",
            zoomOption: const ZoomOption(initZoom: 8),
            // initCurrentUserPosition: UserTrackingOption.withoutUserPosition(),
            initPosition: GeoPoint(latitude: 47.4358055, longitude: 8.4737324),
            radius: 8.0,
            context: context)
        .then((value) => emit(LocationPickedState(location: value)));
  }

  register({required UserModel user}) async {
    emit(LoadingState());
    print(user.toMap());
    try {
      String? token = SharedPreferencesManager()
          .getString(SharedPreferencesConstants.token);

      _dio.options.headers["Authorization"] = "Bearer $token";
      await _dio
          .post(
        Endpoints.register,
        data: FormData.fromMap(user.toMap()),
      )
          .then((value) {
        print(value.statusCode);
        if (value.statusCode == 201) {
          emit(OkResponseState());
        } else {
          emit(ErrorState());
        }
      });
    } catch (e) {
      print(e.toString());
      emit(ErrorState());
    }
  }
}
