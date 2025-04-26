import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:watch_store/component/di.dart';
import 'package:watch_store/data/model/prodoct_detail_model.dart';
import 'package:watch_store/data/repositroy/product_repostroy.dart';

part 'prodoct_detail_event.dart';
part 'prodoct_detail_state.dart';

class ProdoctDetailBloc extends Bloc<ProdoctDetailEvent, ProdoctDetailState> {
  final IProductRepositroy productRepositroy = locator.get();
  ProdoctDetailBloc() : super(ProdoctDetailLoadingState()) {
    on<ProdoctDetailEvent>((event, emit) async {
      if (event is ProdoctDetailInitEvent) {
        emit(ProdoctDetailLoadingState());
        try {
          var res = await productRepositroy.getProductDetailes(event.id);
          emit(ProdoctDetailSucessState(productDetailes: res));
        } catch (e) {
          emit(ProdoctDetailErrorState(error: 'حطا نامشخص'));
        }
      }
    });
  }
}
