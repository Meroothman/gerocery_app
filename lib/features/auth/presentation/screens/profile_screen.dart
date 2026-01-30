import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grocesry_app/core/app_styles.dart';
import 'package:grocesry_app/core/widgets/custom_button.dart';
import 'package:grocesry_app/features/auth/cubit/app_auth/app_auth_cubit.dart';
import 'package:grocesry_app/features/auth/presentation/screens/login_screen.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../home/presentation/screens/add_product_screen.dart';

class ProfileScreen extends StatelessWidget {
  ProfileScreen({super.key});
  final user = Supabase.instance.client.auth.currentUser;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppAuthCubit, AppAuthState>(
      listener: (context, state) {
        if (state is AppAuthSuccess) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => LoginScreen()),
          );
        }
      },
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(title: Text("Profile")),
          body: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                CircleAvatar(radius: 50, child: Icon(Icons.person, size: 50)),
                SizedBox(height: 20),
                Text(
                  user?.userMetadata?["username"] ?? "UserName",
                  style: AppStyles.bodyLarge,
                ),
                SizedBox(height: 10),
                Text(
                  user?.email ?? "Email@gmail.com",
                  style: AppStyles.bodyMedium,
                ),

                Spacer(),
                CustomButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return AddProductScreen();
                        },
                      ),
                    );
                  },
                  text: "Add Product",
                ),
                SizedBox(height: 30),
                state is AppAuthLoading
                    ? Center(child: CircularProgressIndicator())
                    : CustomButton(
                        onPressed: () {
                          BlocProvider.of<AppAuthCubit>(context).logOut();
                        },
                        text: "Logout",
                      ),
                SizedBox(height: 30),
              ],
            ),
          ),
        );
      },
    );
  }
}
