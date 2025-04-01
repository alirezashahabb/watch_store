import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_osm_plugin/flutter_osm_plugin.dart';
import 'package:watch_store/component/di.dart';
import 'package:watch_store/constant/endpoinst.dart';
import 'package:watch_store/constant/share_prefance_constant.dart';
import 'package:watch_store/data/model/user.dart';
import 'package:watch_store/utils/share_prefance_manger.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  final Dio httpClinet = locator.get();
  RegisterCubit() : super(RegisterLoadingState());

  picktheLotion(BuildContext context) async {
    await showSimplePickerLocation(
      context: context,
      isDismissible: true,
      title: 'انتخاب موقعیت مکانی',
      textCancelPicker: 'لغو',
      textConfirmPicker: 'تایید',
      zoomOption: ZoomOption(initZoom: 8),
      initCurrentUserPosition: UserTrackingOption.withoutUserPosition(),
      radius: 8,
    ).then(
      (value) {
        emit(
          RegisterGeoPintState(
            geoPoint: value,
          ),
        );
      },
    );
    //User
  }

  register({required UserModel user}) async {
    emit(RegisterLoadingState());
    try {
      String? token = SharedPreferencesManager()
          .getString(SharedPreferencesConstants.token);
      httpClinet.options.headers['Authorization'] = 'Bearer $token';
      await httpClinet
          .post(
        Endpoints.register,
        data: FormData.fromMap(
          user.toMap(),
        ),
      )
          .then(
        (value) {
          if (value.statusCode == 201) {
            emit(RegisterSucessState());
          } else {
            emit(RegisterErrorState());
          }
        },
      );
    } catch (e) {
      emit(RegisterErrorState());
    }
  }
}
