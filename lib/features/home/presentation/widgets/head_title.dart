import 'package:flutter/material.dart';

import '../../../../core/app_colors.dart';
import '../../../../core/app_styles.dart';

class HeadTitle extends StatelessWidget {
  final String title;
  final void Function()? onPressed;
  const HeadTitle({super.key , required this.title, this.onPressed} );

  @override
  Widget build(BuildContext context) {
    return Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(title, style: AppStyles.headingMedium),
              TextButton(
                onPressed: onPressed,
                child: Text(
                  "See All",
                  style: AppStyles.bodyMedium.copyWith(
                    color: AppColors.primary,
                  ),
                ),
              ),
            ],
          );
  }
}