import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grocesry_app/core/app_colors.dart';
import 'package:grocesry_app/core/widgets/custom_button.dart';
import 'package:grocesry_app/core/widgets/custom_text_feild.dart';
import 'package:grocesry_app/features/home/cubit/product_cubit.dart';

class AddProductScreen extends StatelessWidget {
  AddProductScreen({super.key});

  final TextEditingController nameController = TextEditingController();
  final TextEditingController priceController = TextEditingController();
  final TextEditingController imageController = TextEditingController();
  final TextEditingController desController = TextEditingController();
  final TextEditingController sizeController = TextEditingController();
  final TextEditingController quantityController = TextEditingController();
  final TextEditingController categoryController = TextEditingController();
  final TextEditingController reviewController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Add Product"), centerTitle: true),
      body: BlocConsumer<ProductCubit, ProductState>(
        listener: (context, state) {
          if (state is ProductError) {
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(SnackBar(content: Text(state.msg)));
          }
          if (state is ProductSuccess) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text("Product Added Successfully")),
            );

            Navigator.pop(context);
          }
        },
        builder: (context, state) {
          return Form(
            key: formKey,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: SingleChildScrollView(
                child: Column(
                  spacing: 10,
                  children: [
                    CustomTextFeild(
                      fillColor: AppColors.border,
                      filled: true,
                      controller: nameController,
                      labelText: "Product Name",
                      hintText: "Type Text",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    CustomTextFeild(
                      fillColor: AppColors.border,
                      filled: true,
                      controller: priceController,
                      labelText: "Product Price",
                      hintText: "Type Number",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    CustomTextFeild(
                      fillColor: AppColors.border,
                      filled: true,
                      controller: imageController,
                      labelText: "Product Image",
                      hintText: "Type Text or Link",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    CustomTextFeild(
                      fillColor: AppColors.border,
                      filled: true,
                      controller: desController,
                      labelText: "Product Description",
                      hintText: "Type Text",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    CustomTextFeild(
                      fillColor: AppColors.border,
                      filled: true,
                      controller: sizeController,
                      labelText: "Product Size",
                      hintText: "Type Text",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    CustomTextFeild(
                      fillColor: AppColors.border,
                      filled: true,
                      controller: reviewController,
                      labelText: "Product Name",
                      hintText: "Type 1 => 5",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    CustomTextFeild(
                      fillColor: AppColors.border,
                      filled: true,
                      controller: quantityController,
                      labelText: "Product Quantity",
                      hintText: "Type Number",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    CustomTextFeild(
                      fillColor: AppColors.border,
                      filled: true,
                      controller: categoryController,
                      labelText: "Product Category",
                      hintText: "Type Text",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    state is ProductLoading
                        ? CircularProgressIndicator()
                        : CustomButton(
                            onPressed: () {
                              if (formKey.currentState!.validate()) {
                                BlocProvider.of<ProductCubit>(
                                  context,
                                ).addProduct(
                                  name: nameController.text,
                                  price: double.parse(priceController.text),
                                  image: imageController.text,
                                  quantity: int.parse(quantityController.text),
                                  size: sizeController.text,
                                  description: desController.text,
                                  category: categoryController.text,
                                  review: int.parse(reviewController.text),
                                );
                              }
                            },
                            text: "Add Product",
                          ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
