import 'package:bloc/bloc.dart';
import 'package:grocesry_app/features/home/data/models/product_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

part 'product_state.dart';

class ProductCubit extends Cubit<ProductState> {
  ProductCubit() : super(ProductInitial());
  final supabase = Supabase.instance.client;

  Future<void> getProducts() async {
    emit(ProductLoading());
    try {
      final response = await supabase
          .from("products")
          .select()
          .order("created_at", ascending: false);

      final products = response
          .map<ProductModel>((e) => ProductModel.fromJson(e))
          .toList();

      emit(ProductSuccess(products: products));
    } catch (e) {
      emit(ProductError(msg: e.toString()));
    }
  }

  addProduct({
    required String name,
    required double price,
    required String image,
    required int quantity,
    required String size,
    required String description,
    required String category,
    required int review,
  }) async {
    emit(ProductLoading());
    try {
      await supabase.from("products").insert({
        "name": name,
        "price": price,
        "image": image,
        "quantity": quantity,
        "size": size,
        "description": description,
        "category": category,
        "review": review,
      });

      emit(AddProductSuccess());
      await getProducts();
    } catch (e) {
      emit(ProductError(msg: e.toString()));
    }
  }
}
