import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter_osm_plugin/flutter_osm_plugin.dart';
import 'package:meta/meta.dart';
import 'package:watch_store/data/constant/url_string.dart';
import 'package:watch_store/data/model/user.dart';
import 'package:watch_store/utils/sahred_prefrence_constant.dart';
import 'package:watch_store/utils/shared_pref_mangment.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit() : super(RegisterInitialState());

  final Dio _dio = Dio();

  /// for get and pick location  location
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

        //  send  location for RegisterLocationState
        .then((value) => emit(RegisterLocationState(location: value)));
  }

  // this is for register
  registerUser({required UserModel user}) async {
    try {
      emit(RegisterLoadingState());

      /// get token from catch
      String? token =
          SharedPreferenceManger().getString(SharedPreferencesConstants.token);
      _dio.options.headers['Authorization'] = 'Bearer $token';
      await _dio
          .post(Endpoints.register, data: FormData.fromMap(user.toMap()))
          .then((value) {
        print(value.statusCode);
        if (value.statusCode == 201) {
          emit(RegisterSuccessfulState());
        } else {
          emit(RegisterErrorState());
        }
      });
    } catch (e) {
      emit(RegisterErrorState());
    }
  }
}
