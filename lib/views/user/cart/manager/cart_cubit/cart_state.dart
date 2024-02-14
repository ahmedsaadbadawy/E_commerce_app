part of 'cart_cubit.dart';

@immutable
sealed class CartState {}

final class CartInitial extends CartState {}

final class UpdatePriceSuccess extends CartState {}

final class AddOrderSuccess extends CartState {}
