import 'package:flutter/material.dart';
import 'package:grocesry_app/core/app_colors.dart';
import 'package:grocesry_app/core/app_images.dart';
import 'package:grocesry_app/core/app_styles.dart';
import 'package:grocesry_app/core/widgets/custom_button.dart';
import 'package:grocesry_app/features/auth/presentation/screens/login_screen.dart';

class OnBoardScreen extends StatelessWidget {
  const OnBoardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(AppImages.onBoardingBackground),
          ),
        ),
        child: Column(
          spacing: 10,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Image.asset(AppImages.whiteLogo),
            Text(
              "   Welcome \n To our Store",
              style: AppStyles.headingLarge.copyWith(
                color: AppColors.white,
                fontSize: 48,
              ),
            ),
            Text(
              "Ger your groceries in as fast as one hour",
              style: AppStyles.bodyMedium.copyWith(color: AppColors.white),
            ),

            Padding(
              padding: const EdgeInsets.all(16.0),
              child: CustomButton(
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => LoginScreen()),
                  );
                },
                text: "Get Started",
              ),
            ),
            const SizedBox(height: 60),
          ],
        ),
      ),
    );
  }
}
