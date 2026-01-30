import 'package:flutter/material.dart';
import 'package:grocesry_app/features/home/data/models/product_model.dart';

import 'custom_product_card.dart';

class CustomProductList extends StatelessWidget {
  final List<ProductModel> products;
  const CustomProductList({super.key, required this.products});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 220,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        itemCount: products.length,
        itemBuilder: (context, indaex) {
          return CustomProductCard(productModel: products[indaex]);
        },
      ),
    );
  }
}
