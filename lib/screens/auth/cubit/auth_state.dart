part of 'auth_cubit.dart';

@immutable
sealed class AuthState {}

final class AuthInitialState extends AuthState {}

final class AuthLoadingState extends AuthState {}

final class AuthErrorState extends AuthState {}

final class AuthSendSmsState extends AuthState {
  /// get phone number and use next page
  final String number;

  AuthSendSmsState({required this.number});
}

// this state for check and verify otpCode
final class AuthIsVerifyState extends AuthState {}

final class AuthNotVerifyState extends AuthState {}

final class AuthLoggedInState extends AuthState {}

final class AuthLogeOutState extends AuthState {}

final class AuthDialogState extends AuthState {}
