part of 'home_bloc.dart';

sealed class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object> get props => [];
}

final class HomeLoadingState extends HomeState {}

final class HomeSuccessState extends HomeState {
  final HomeModel homeModel;

  const HomeSuccessState({required this.homeModel});
}

final class HomeErrorState extends HomeState {}
