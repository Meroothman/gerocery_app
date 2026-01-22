import 'package:flutter/material.dart';

import 'custom_product_card.dart';

class CustomProductList extends StatelessWidget {
  const CustomProductList({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
            height: 220,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              itemCount: 10,
              itemBuilder: (context, indaex) {
                return CustomProductCard();
              },
            ),
          );
  }
}