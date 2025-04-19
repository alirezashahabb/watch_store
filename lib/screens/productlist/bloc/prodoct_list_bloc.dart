import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:watch_store/component/di.dart';
import 'package:watch_store/data/model/product_model.dart';
import 'package:watch_store/data/repositroy/product_repostroy.dart';

part 'prodoct_list_event.dart';
part 'prodoct_list_state.dart';

class ProdoctListBloc extends Bloc<ProdoctListEvent, ProdoctListState> {
  final IProductRepositroy productRepositroy = locator.get();
  ProdoctListBloc() : super(ProdoctLisLoadingState()) {
    on<ProdoctListEvent>((event, emit) async {
      if (event is ProdoctListInitEvent) {
        emit(ProdoctLisLoadingState());
        try {
          var prdoct = await productRepositroy.getAllByBrand(event.id);
          emit(ProdoctLisResponseState(product: prdoct));
        } catch (e) {
          emit(
            ProdoctLisErrorState(error: 'خطا نا مشخص'),
          );
        }
      }
    });
  }
}
