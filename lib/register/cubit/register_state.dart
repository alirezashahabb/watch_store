part of 'register_cubit.dart';

@immutable
sealed class RegisterState {}

final class RegisterInitialState extends RegisterState {}

final class RegisterSucessState extends RegisterState {}

final class RegisterErrorState extends RegisterState {}
