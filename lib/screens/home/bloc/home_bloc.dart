import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:watch_store/data/model/home.dart';
import 'package:watch_store/data/repo/home_repo.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final HomeRepository _homeRepo;
  HomeBloc(this._homeRepo) : super(HomeLoadingState()) {
    on<HomeEvent>((event, emit) async {
      if (event is HomeStartedEvent) {
        try {
          emit(HomeLoadingState());
          final home = await _homeRepo.getHome();
          emit(HomeSuccessState(homeModel: home));
        } catch (e) {
          emit(HomeErrorState());
        }
      }
    });
  }
}
