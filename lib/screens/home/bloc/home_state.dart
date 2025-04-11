part of 'home_bloc.dart';

@immutable
sealed class HomeState {}

final class HomeLoadingState extends HomeState {}

final class HomeErrorState extends HomeState {}

final class HomeResponseState extends HomeState {
  final HomeModel home;

  HomeResponseState({
    required this.home,
  });
}
