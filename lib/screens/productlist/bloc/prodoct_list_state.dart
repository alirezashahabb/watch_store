part of 'prodoct_list_bloc.dart';

@immutable
sealed class ProdoctListState {}

final class ProdoctListInitialState extends ProdoctListState {}

final class ProdoctLisLoadingState extends ProdoctListState {}

final class ProdoctLisResponseState extends ProdoctListState {
  final List<ProductModel> product;

  ProdoctLisResponseState({required this.product});
}

final class ProdoctLisErrorState extends ProdoctListState {
  final String error;

  ProdoctLisErrorState({
    required this.error,
  });
}
