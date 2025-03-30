import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';
import 'package:watch_store/component/di.dart';
import 'package:watch_store/constant/endpoinst.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final Dio httpClient = locator.get();
  AuthCubit() : super(AuthInitial()) {
    emit(LoggedOutState());
  }
  //Send Sms
  sendSms(String mobile) async {
    emit(AuthLoadingState());
    try {
      await httpClient.post(Endpoints.sendSms, data: {
        'mobile': mobile,
      }).then(
        (value) {
          print(value.toString());
          if (value.statusCode == 201) {
            emit(
              AuthSuccessState(
                mobile: mobile,
              ),
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

  cheackSms(String mobile, String code) async {
    emit(AuthLoadingState());
    try {
      await httpClient.post(Endpoints.checkSmsCode, data: {
        'mobile': mobile,
        'code': code,
      }).then(
        (value) {
          print(value.toString());
          if (value.statusCode == 201) {
            if (value.data['data']['is_registered']) {
              emit(AuthVefiyIsRegistredState());
            } else {
              emit(AuthVefiyNotRegistredState());
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
}
