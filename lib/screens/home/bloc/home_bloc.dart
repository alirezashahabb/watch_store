import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:watch_store/component/di.dart';
import 'package:watch_store/data/model/home_model.dart';
import 'package:watch_store/data/repositroy/home_repositrot.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final IHomeRepo homeRepo = locator.get();
  HomeBloc() : super(HomeLoadingState()) {
    on<HomeEvent>((event, emit) async {
      if (event is HomeInitEvent) {
        emit(HomeLoadingState());
        try {
          var response = await homeRepo.getHome();
          emit(HomeResponseState(home: response));
        } catch (e) {
          emit(HomeErrorState());
        }
      }
    });
  }
}
