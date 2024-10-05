import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:watch_store/data/model/product.dart';
import 'package:watch_store/data/repo/product_repo.dart';

part 'productlist_event.dart';
part 'productlist_state.dart';

class ProductsListBloc extends Bloc<ProductsListEvent, ProductsListState> {
  final IProductRepo _iProductRepo;
  ProductsListBloc(this._iProductRepo) : super(ProductsListLoadingState()) {
    on<ProductsListEvent>((event, emit) async {
      if (event is ProductListInitEvent) {
        try {
          emit(ProductsListLoadingState());
          final categoryList =
              await _iProductRepo.getAllByCategory(event.params);
          emit(ProductsListSuccessState(productList: categoryList));
        } catch (e) {
          emit(ProductsListErrorState());
        }
      }
    });
  }
}
