part of 'get_delivery_data_cubit.dart';

sealed class GetDeliveryDataState extends Equatable {
  const GetDeliveryDataState();

  @override
  List<Object> get props => [];
}

final class GetDeliveryDataInitial extends GetDeliveryDataState {}

final class GetDeliveryDataLoading extends GetDeliveryDataState {}

final class GetDeliveryDataFailure extends GetDeliveryDataState {
  final String errorMessage;

  const GetDeliveryDataFailure(this.errorMessage);
}

final class GetDeliveryDataSuccess extends GetDeliveryDataState {
  final List<UserModel> delivery;

  const GetDeliveryDataSuccess(this.delivery);
}
