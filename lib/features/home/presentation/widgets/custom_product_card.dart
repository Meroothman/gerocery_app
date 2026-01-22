import 'package:flutter/material.dart';

import '../../../../core/app_colors.dart';
import '../../../../core/app_images.dart';
import '../../../../core/app_styles.dart';

class CustomProductCard extends StatelessWidget {
  const CustomProductCard({super.key});

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
            Center(child: Image.asset(AppImages.apple)),
            SizedBox(height: 10),
            Text(
              "Red Apple",
              style: AppStyles.bodyLarge.copyWith(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 5),
            Text("7pcs, Priceg", style: AppStyles.bodyMedium),
            Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("\$4.99", style: AppStyles.bodyLarge),
                Container(
                  height: 30,
                  width: 30,
                  decoration: BoxDecoration(
                    color: AppColors.primary,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Icon(Icons.add, color: Colors.white),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
