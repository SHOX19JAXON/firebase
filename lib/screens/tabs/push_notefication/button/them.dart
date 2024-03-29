
import 'package:flutter/material.dart';

import '../../../../utils/colors/app_colors.dart';

class MyButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final ButtonStyle? style; // Make the ButtonStyle nullable

  const MyButton({
    super.key, // Add key parameter
    required this.text,
    required this.onPressed,
    this.style,
  }); // Pass key to super constructor

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 120,
      child: ElevatedButton(
        onPressed: onPressed,
        style: style ?? ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
            side: const BorderSide(
              color: AppColors.c_2C2C73, // Set border color to white
              width: 1, // Set border width to 1 pixel
            ),// Set circular border radius
          ), backgroundColor: AppColors.c_F9F9F9, // Set background color to white
        ),
        child: Text(text), // Apply custom styles if provided, or use default styles
      ),
    );
  }
}