part of 'cart_cubit.dart';

abstract class CartState {}

class CartInitial extends CartState {}

class CartLoading extends CartState {}

class CartSuccess extends CartState {
  final List<CartItemModel> cartItems;
  final double totalPrice;
  CartSuccess({required this.cartItems, required this.totalPrice});
}

class CartError extends CartState {
  final String msg;
  CartError({required this.msg});
}
