import 'package:flutter/material.dart';
import 'package:grocesry_app/core/app_styles.dart';
import 'package:grocesry_app/core/widgets/custom_text_feild.dart';
import 'package:grocesry_app/features/auth/presentation/screens/sign_up_screen.dart';
import 'package:grocesry_app/features/auth/presentation/widgets/custom_row_data.dart';

import '../../../../core/app_images.dart';
import '../../../../core/widgets/custom_button.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage(AppImages.authBackGround)),
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 80.0, bottom: 100),
                child: Image.asset(AppImages.logo),
              ),

              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  spacing: 10,
                  children: [
                    Text("Login", style: AppStyles.headingLarge),
                    Text(
                      "Enter your email and password",
                      style: AppStyles.bodyMedium,
                    ),
                    SizedBox(height: 20),
                    CustomTextFeild(
                      controller: TextEditingController(),
                      labelText: "Email",
                      border: UnderlineInputBorder(),
                    ),
                    SizedBox(height: 20),
                    CustomTextFeild(
                      controller: TextEditingController(),
                      labelText: "Password",
                      isPassword: true,
                      border: UnderlineInputBorder(),
                    ),
                    SizedBox(height: 20),
                    CustomButton(text: "Login", onPressed: () {}),
                    CustomRowData(
                      text: "Don't have an account ?",
                      textButton: "Sign Up",
                      screenName: SignUpScreen(),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
