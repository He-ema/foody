part of 'item_handler_cubit.dart';

sealed class ItemHandlerState extends Equatable {
  const ItemHandlerState();

  @override
  List<Object> get props => [];
}

final class ItemHandlerInitial extends ItemHandlerState {}

final class ItemHandlerLoading extends ItemHandlerState {}

final class ItemHandlerFailure extends ItemHandlerState {
  final String errorMessage;

  const ItemHandlerFailure(this.errorMessage);
}

final class ItemHandlerSuccess extends ItemHandlerState {
  final bool exist;

  const ItemHandlerSuccess(this.exist);
}
