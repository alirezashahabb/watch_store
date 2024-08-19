import 'package:bloc/bloc.dart';
import "package:dio/dio.dart";
import 'package:flutter/material.dart';
import 'package:watch_store/data/constant/url_string.dart';
import 'package:watch_store/utils/sahred_prefrence_constant.dart';
import 'package:watch_store/utils/shared_pref_mangment.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final Dio _dio = Dio();
  AuthCubit() : super(AuthInitialState()) {
    emit(AuthLogeOutState());
  }

  sendSms(String mobile) async {
    try {
      emit(AuthLoadingState());
      await _dio.post(Endpoints.sendSms, data: {"mobile": mobile}).then(
        (value) {
          if (value.statusCode == 201) {
            emit(
              AuthSuccessesState(number: mobile),
            );
          } else {
            emit(AuthErrorState());
          }
        },
      );
    } catch (e) {
      emit(AuthErrorState());
    }
  }

  // check otp
  checkOtp(String mobile, String code) async {
    emit(AuthLoadingState());
    try {
      await _dio.post(Endpoints.checkSmsCode, data: {
        "mobile": mobile,
        'code': code,
      }).then(
        (value) {
          if (value.statusCode == 201) {
            SharedPreferenceManger().saveString(
                SharedPreferencesConstants.token, value.data['data']['token']);

            if (value.data['data']['is_registered']) {
              emit(AuthIsVerifyState());
            } else {
              emit(AuthNotVerifyState());
            }
          } else {
            emit(AuthErrorState());
          }
        },
      );
    } catch (e) {
      emit(AuthErrorState());
    }
  }

  // register user app

  registration() {}

  // check logout
  logout() {}
}
