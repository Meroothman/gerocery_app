import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grocesry_app/core/app_styles.dart';
import 'package:grocesry_app/core/widgets/custom_text_feild.dart';
import 'package:grocesry_app/features/auth/cubit/app_auth/app_auth_cubit.dart';
import 'package:grocesry_app/features/auth/presentation/screens/sign_up_screen.dart';
import 'package:grocesry_app/features/auth/presentation/widgets/custom_row_data.dart';

import '../../../../core/app_images.dart';
import '../../../../core/widgets/custom_button.dart';
import '../../../home/presentation/screens/home_screen.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final  GlobalKey<FormState> formKey = GlobalKey<FormState>();
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
                          Text("Login", style: AppStyles.headingLarge),
                          Text(
                            "Enter your email and password",
                            style: AppStyles.bodyMedium,
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
                                  text: "Login",
                                  onPressed: () {
                                    if (formKey.currentState!.validate()) {
                                      BlocProvider.of<AppAuthCubit>(
                                        context,
                                      ).login(
                                        email: emailController.text,
                                        password: passwordController.text,
                                      );
                                    }
                                  },
                                ),
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
          ),
        );
      },
    );
  }
}
