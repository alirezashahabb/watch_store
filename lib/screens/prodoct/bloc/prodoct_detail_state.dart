part of 'prodoct_detail_bloc.dart';

@immutable
sealed class ProdoctDetailState {}

final class ProdoctDetailLoadingState extends ProdoctDetailState {}

final class ProdoctDetailSucessState extends ProdoctDetailState {
  final ProductDetailes productDetailes;

  ProdoctDetailSucessState({
    required this.productDetailes,
  });
}

final class ProdoctDetailErrorState extends ProdoctDetailState {
  final String error;

  ProdoctDetailErrorState({
    required this.error,
  });
}
