part of 'orders_cubit.dart';

@immutable
sealed class OrdersState {}

final class OrdersInitial extends OrdersState {}

final class OrdersSuccess extends OrdersState {
  final List<UserOrder> usersOrdersList;

   OrdersSuccess({required this.usersOrdersList});
}
