import 'package:flutter/material.dart';

import '../../../../core/app_styles.dart';

class CustomRowData extends StatelessWidget {
  const CustomRowData({
    super.key,
    required this.text,
    required this.textButton,
    required this.screenName,
  });

  final String text;
  final Widget screenName;
  final String textButton;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(text, style: AppStyles.bodyMedium),
        TextButton(
          onPressed: () {
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (context) => screenName),
            );
          },
          child: Text(textButton, style: AppStyles.bodyMedium),
        ),
      ],
    );
  }
}
