part of 'auth_cubit.dart';

@immutable
sealed class AuthState {}

final class AuthInitialState extends AuthState {}

final class AuthLoadingState extends AuthState {}

final class AuthErrorState extends AuthState {}

final class AuthSuccessesState extends AuthState {}

// this state for check and verify otpCode
final class AuthVerifyState extends AuthState {}

final class AuthLoggedInState extends AuthState {}

final class AuthLogeOutState extends AuthState {}
