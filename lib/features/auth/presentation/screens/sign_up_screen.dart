import 'package:flutter/material.dart';
import 'package:grocesry_app/core/app_styles.dart';
import 'package:grocesry_app/core/widgets/custom_button.dart';
import 'package:grocesry_app/core/widgets/custom_text_feild.dart';
import 'package:grocesry_app/features/auth/presentation/widgets/custom_row_data.dart';

import '../../../../core/app_images.dart';
import 'login_screen.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({super.key});
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();

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
          child: Form(
            key: formKey,
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
                      Text("Sign Up", style: AppStyles.headingLarge),
                      Text(
                        "Enter your Credentials to continue",
                        style: AppStyles.bodyMedium,
                      ),
                      SizedBox(height: 20),
                      CustomTextFeild(
                        controller: usernameController,
                        labelText: "Username",
                        border: UnderlineInputBorder(),
                      ),
                      SizedBox(height: 20),
                      CustomTextFeild(
                        controller: emailController,
                        labelText: "Email",
                        border: UnderlineInputBorder(),
                      ),
                      SizedBox(height: 20),
                      CustomTextFeild(
                        controller: passwordController,
                        labelText: "Password",
                        isPassword: true,
                        border: UnderlineInputBorder(),
                      ),
                      SizedBox(height: 20),
                      CustomButton(text: "Login", onPressed: () {}),
                      CustomRowData(
                        text: "Already have an account ?",
                        textButton: "Login",
                        screenName: LoginScreen(),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
