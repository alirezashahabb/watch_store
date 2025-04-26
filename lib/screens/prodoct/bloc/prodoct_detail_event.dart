part of 'prodoct_detail_bloc.dart';

@immutable
sealed class ProdoctDetailEvent {}

class ProdoctDetailInitEvent extends ProdoctDetailEvent {
  final int id;

  ProdoctDetailInitEvent({
    required this.id,
  });
}
