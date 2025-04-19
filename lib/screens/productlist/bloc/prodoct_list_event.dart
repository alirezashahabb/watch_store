part of 'prodoct_list_bloc.dart';

@immutable
sealed class ProdoctListEvent {}

class ProdoctListInitEvent extends ProdoctListEvent {
  final int id;

  ProdoctListInitEvent({
    required this.id,
  });
}
