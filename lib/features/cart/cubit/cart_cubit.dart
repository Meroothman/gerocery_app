import 'package:bloc/bloc.dart';
import 'package:grocesry_app/features/cart/data/model/cart_item_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit() : super(CartInitial());

  final SupabaseClient supabase = Supabase.instance.client;

  Future<void> getCartItems() async {
    emit(CartLoading());
    try {
      final userId = supabase.auth.currentUser!.id;
      final cart = await getOrCreateCart(userId);

      final response = await supabase
          .from('cart_items')
          .select('''
            id,
            quantity,
            products (
              id,
              name,
              price,
              image,
              quantity
            )
          ''')
          .eq('cart_id', cart['id']);

      final items = response
          .map<CartItemModel>((e) => CartItemModel.fromJson(e))
          .toList();

      emit(CartSuccess(cartItems: items, totalPrice: calculateTotal(items)));
    } catch (e) {
      emit(CartError(msg: e.toString()));
    }
  }

  Future<void> addToCart(String productId) async {
    try {
      final userId = supabase.auth.currentUser!.id;
      final cart = await getOrCreateCart(userId);

      final existingItem = await supabase
          .from('cart_items')
          .select('id, quantity')
          .eq('product_id', productId)
          .eq('cart_id', cart['id'])
          .maybeSingle();

      final product = await supabase
          .from('products')
          .select('quantity')
          .eq('id', productId)
          .single();

      final availableQuantity = product['quantity'] as int;

      if (existingItem != null) {
        if (existingItem['quantity'] >= availableQuantity) return;

        await supabase
            .from('cart_items')
            .update({'quantity': existingItem['quantity'] + 1})
            .eq('id', existingItem['id']);
      } else {
        if (availableQuantity <= 0) return;

        await supabase.from('cart_items').insert({
          'cart_id': cart['id'],
          'product_id': productId,
          'quantity': 1,
        });
      }

      await getCartItems();
    } catch (e) {
      emit(CartError(msg: e.toString()));
    }
  }

  Future<void> updateQuantity({
    required String cartItemId,
    required int quantity,
  }) async {
    if (state is! CartSuccess) return;

    final currentState = state as CartSuccess;
    final item = currentState.cartItems.firstWhere((e) => e.id == cartItemId);

    if (quantity > item.availableQuantity) return;

    if (quantity <= 0) {
      await removeItem(cartItemId: cartItemId);
      return;
    }

    final updatedItems = currentState.cartItems.map((e) {
      if (e.id == cartItemId) {
        return e.copyWith(cartQuantity: quantity);
      }
      return e;
    }).toList();

    emit(
      CartSuccess(
        cartItems: updatedItems,
        totalPrice: calculateTotal(updatedItems),
      ),
    );

    await supabase
        .from('cart_items')
        .update({'quantity': quantity})
        .eq('id', cartItemId);
  }

  Future<void> removeItem({required String cartItemId}) async {
    if (state is! CartSuccess) return;

    final currentState = state as CartSuccess;

    final updatedItems = currentState.cartItems
        .where((e) => e.id != cartItemId)
        .toList();

    emit(
      CartSuccess(
        cartItems: updatedItems,
        totalPrice: calculateTotal(updatedItems),
      ),
    );

    await supabase.from('cart_items').delete().eq('id', cartItemId);
  }

  Future<void> clearCart() async {
    if (state is! CartSuccess) return;

    final userId = supabase.auth.currentUser!.id;
    final cart = await getOrCreateCart(userId);

    emit(CartSuccess(cartItems: [], totalPrice: 0));

    await supabase.from('cart_items').delete().eq('cart_id', cart['id']);
  }

  double calculateTotal(List<CartItemModel> items) {
    return items.fold(0, (sum, item) => sum + (item.price * item.cartQuantity));
  }

  Future<Map<String, dynamic>> getOrCreateCart(String userId) async {
    final existingCart = await supabase
        .from('carts')
        .select()
        .eq('user_id', userId)
        .order('created_at', ascending: true)
        .limit(1)
        .maybeSingle();

    if (existingCart != null) {
      return existingCart;
    }

    return await supabase
        .from('carts')
        .insert({'user_id': userId})
        .select()
        .single();
  }
}
