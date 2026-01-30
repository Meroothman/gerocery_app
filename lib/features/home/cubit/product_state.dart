part of 'product_cubit.dart';

abstract class ProductState {}

class ProductInitial extends ProductState {}

class ProductLoading extends ProductState {}

class ProductSuccess extends ProductState {
  final List<ProductModel> products;
  ProductSuccess({required this.products});
}

class AddProductSuccess extends ProductState {}

class ProductError extends ProductState {
  final String msg;
  ProductError({required this.msg});
}
