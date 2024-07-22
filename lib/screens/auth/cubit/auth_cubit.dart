import 'dart:developer';

import 'package:bloc/bloc.dart';
import "package:dio/dio.dart";
import 'package:meta/meta.dart';

part 'auth_state.dart';

class register extends Cubit<AuthState> {
  final Dio _dio = Dio();
  register() : super(AuthInitialState());

  sendSms(String mobile) async {
    emit(AuthLoadingState());
    try {
      Response response = await _dio.post('public/api/v1/send_sms', data: {
        "mobile": mobile,
      }).then((value) {
        log(value.toString());

        if (value.statusCode == 201) {
          emit(AuthSuccessesState());
        } else {
          emit(AuthErrorState());
        }
        return value.data;
      });
    } catch (e) {
      emit(AuthErrorState());
    }
  }

  // check otp
  checkOtp(String mobile, String code) async {
    emit(AuthLoadingState());
    try {
      Response response =
          await _dio.post('public/api/v1/check_sms_code', data: {
        "mobile": mobile,
        "code": code,
      }).then((value) {
        log(value.toString());

        if (value.statusCode == 201) {
          emit(AuthSuccessesState());
        } else {
          emit(AuthErrorState());
        }
        return value.data;
      });
    } catch (e) {
      emit(AuthErrorState());
    }
  }

  // register user app

  registration() {}

  // check logout
  logout() {}
}
