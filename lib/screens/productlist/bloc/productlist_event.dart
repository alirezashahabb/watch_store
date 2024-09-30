part of 'productlist_bloc.dart';

sealed class ProductsListEvent extends Equatable {
  const ProductsListEvent();

  @override
  List<Object> get props => [];
}

class ProductListInitEvent extends ProductsListEvent {
  final int params;

  const ProductListInitEvent({required this.params});
}
