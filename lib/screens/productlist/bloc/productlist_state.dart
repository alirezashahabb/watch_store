part of 'productlist_bloc.dart';

sealed class ProductsListState extends Equatable {
  const ProductsListState();

  @override
  List<Object> get props => [];
}

final class ProductsListLoadingState extends ProductsListState {}

final class ProductsListSuccessState extends ProductsListState {
  final List<ProductModel> productList;

  const ProductsListSuccessState({required this.productList});
}

final class ProductsListErrorState extends ProductsListState {}
