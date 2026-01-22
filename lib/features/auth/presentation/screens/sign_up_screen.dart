import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grocesry_app/core/app_styles.dart';
import 'package:grocesry_app/core/widgets/custom_button.dart';
import 'package:grocesry_app/core/widgets/custom_text_feild.dart';
import 'package:grocesry_app/features/auth/cubit/app_auth/app_auth_cubit.dart';
import 'package:grocesry_app/features/auth/presentation/widgets/custom_row_data.dart';
import 'package:grocesry_app/features/home/presentation/screens/home_screen.dart';

import '../../../../core/app_images.dart';
import 'login_screen.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({super.key});
  final TextEditingController userNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppAuthCubit, AppAuthState>(
      listener: (context, state) {
        if (state is AppAuthSuccess) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => HomeScreen()),
          );
        }
        if (state is AppAuthFailure) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(state.errorMessage)));
        }
      },
      builder: (context, state) {
        return Scaffold(
          body: Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(AppImages.authBackGround),
              ),
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
                            controller: userNameController,
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
                          state is AppAuthLoading
                              ? Center(child: CircularProgressIndicator())
                              : CustomButton(
                                  text: "Sign Up",
                                  onPressed: () {
                                    if (formKey.currentState!.validate()) {
                                      BlocProvider.of<AppAuthCubit>(
                                        context,
                                      ).signUp(
                                        email: emailController.text,
                                        password: passwordController.text,
                                        userName: userNameController.text,
                                      );
                                    }
                                  },
                                ),
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
      },
    );
  }
}
