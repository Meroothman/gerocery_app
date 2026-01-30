import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grocesry_app/core/app_styles.dart';
import 'package:grocesry_app/features/cart/cubit/cart_cubit.dart';
import '../../../../core/app_colors.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("My Cart", style: AppStyles.headingLarge),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              context.read<CartCubit>().clearCart();
            },
            icon: const Icon(Icons.cleaning_services),
          ),
        ],
      ),
      body: BlocBuilder<CartCubit, CartState>(
        builder: (context, state) {
          if (state is CartLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          if (state is CartSuccess) {
            if (state.cartItems.isEmpty) {
              return const Center(child: Text("Your cart is empty"));
            }

            return ListView.separated(
              itemCount: state.cartItems.length,
              padding: EdgeInsets.zero,
              itemBuilder: (context, index) {
                final item = state.cartItems[index];

                return ListTile(
                  leading: Image.network(item.image, width: 50),
                  title: Text(
                    item.name,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  ),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("${item.price} EGP"),
                      const SizedBox(height: 5),
                      Text(
                        "Available: ${item.availableQuantity}",
                        style: AppStyles.hint,
                      ),
                    ],
                  ),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        onPressed: () {
                          context.read<CartCubit>().updateQuantity(
                            cartItemId: item.id,
                            quantity: item.cartQuantity - 1,
                          );
                        },
                        icon: const Icon(Icons.remove),
                      ),
                      Text(item.cartQuantity.toString()),
                      IconButton(
                        onPressed: () {
                          context.read<CartCubit>().updateQuantity(
                            cartItemId: item.id,
                            quantity: item.cartQuantity + 1,
                          );
                        },
                        icon: const Icon(Icons.add),
                      ),
                      IconButton(
                        onPressed: () {
                          context.read<CartCubit>().removeItem(
                            cartItemId: item.id,
                          );
                        },
                        icon: const Icon(Icons.delete),
                      ),
                    ],
                  ),
                );
              },
              separatorBuilder: (context, index) => Divider(
                thickness: 2,
                color: AppColors.border,
                indent: 16,
                endIndent: 16,
              ),
            );
          }

          if (state is CartError) {
            return Center(child: Text(state.msg));
          }

          return const SizedBox.shrink();
        },
      ),
    );
  }
}
