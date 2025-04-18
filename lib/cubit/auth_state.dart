part of 'auth_cubit.dart';

@immutable
sealed class AuthState {}

final class AuthInitial extends AuthState {}

final class AuthLoadingState extends AuthState {}

final class AuthErrorState extends AuthState {}

final class AuthSuccessState extends AuthState {
  final String mobile;

  AuthSuccessState({
    required this.mobile,
  });
}

final class AuthVefiyIsRegistredState extends AuthState {}

final class AuthVefiyNotRegistredState extends AuthState {}

final class LoggedInState extends AuthState {}

final class LoggedOutState extends AuthState {}
