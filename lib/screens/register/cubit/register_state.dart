part of 'register_cubit.dart';

@immutable
sealed class RegisterState {}

final class RegisterInitialState extends RegisterState {}

final class RegisterLoadingState extends RegisterState {}

final class RegisterErrorState extends RegisterState {}

final class RegisterSuccessfulState extends RegisterState {}

final class RegisterLotionState extends RegisterState {}
