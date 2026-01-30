import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grocesry_app/core/app_colors.dart';
import 'package:grocesry_app/core/app_images.dart';
import 'package:grocesry_app/core/app_styles.dart';
import 'package:grocesry_app/core/widgets/custom_text_feild.dart';
import 'package:grocesry_app/features/home/cubit/product_cubit.dart';
import 'package:grocesry_app/features/home/presentation/widgets/custom_product_list.dart';
import 'package:grocesry_app/features/home/presentation/widgets/head_title.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController searchController = TextEditingController();
    return Padding(
      padding: const EdgeInsets.only(top: 50, left: 16, right: 16),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Image.asset(AppImages.logo, height: 30, width: 30),
            SizedBox(height: 10),
            Text("Alex,Sidi Basher", style: AppStyles.bodyLarge),
            SizedBox(height: 10),
            CustomTextFeild(
              controller: searchController,
              hintText: "Search",
              fillColor: AppColors.border,
              filled: true,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide.none,
              ),
            ),
            SizedBox(height: 10),
            Image.asset(AppImages.banner),
            HeadTitle(title: "Exclusive Offers", onPressed: () {}),
            BlocBuilder<ProductCubit, ProductState>(
              builder: (context, state) {
                if (state is ProductLoading) {
                  return Center(
                    child: CircularProgressIndicator(color: AppColors.primary),
                  );
                } else if (state is ProductSuccess) {
                  return CustomProductList(products: state.products);
                } else if (state is ProductError) {
                  return Center(child: Text(state.msg));
                }
                return Center(child: Text("No data to Show"));
              },
            ),
            // HeadTitle(title: "Best Selling", onPressed: () {}),
            // CustomProductList(),
            // HeadTitle(title: "Best Selling", onPressed: () {}),
            // CustomProductList(),
          ],
        ),
      ),
    );
  }
}
