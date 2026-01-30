import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grocesry_app/features/cart/cubit/cart_cubit.dart';
import 'package:grocesry_app/features/home/data/models/product_model.dart';

import '../../../../core/app_colors.dart';
import '../../../../core/app_styles.dart';

class CustomProductCard extends StatelessWidget {
  final ProductModel productModel;
  const CustomProductCard({super.key, required this.productModel});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(8),
      height: 200,
      width: 160,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: AppColors.border, width: 2),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Image.network(productModel.image, height: 80, width: 80),
            ),
            SizedBox(height: 10),
            Text(
              productModel.name,
              style: AppStyles.bodyLarge.copyWith(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 5),
            Text(
              "${productModel.quantity} ${productModel.size}",
              style: AppStyles.bodyMedium,
            ),
            Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              mainAxisSize: MainAxisSize.max,
              children: [
                Expanded(
                  child: Text(
                    "${productModel.price}/per ${productModel.size}",
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                    style: AppStyles.bodyLarge,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    BlocProvider.of<CartCubit>(
                      context,
                    ).addToCart(productModel.id);
                  },
                  child: Container(
                    height: 30,
                    width: 30,
                    decoration: BoxDecoration(
                      color: AppColors.primary,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Icon(Icons.add, color: Colors.white),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
