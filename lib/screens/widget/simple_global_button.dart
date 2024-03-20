import 'package:firebase/utils/project_extensions.dart';
import 'package:flutter/material.dart';

import '../../utils/colors/app_colors.dart';
import '../../utils/styles/app_text_style.dart';


class SimpleGlobalButton extends StatelessWidget {
  const SimpleGlobalButton({
    super.key,
    required this.onTap,
    required this.title,
    required this.horizontalPadding,
  });

  final VoidCallback onTap;
  final String title;
  final double horizontalPadding;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
      width: width,
      child: TextButton(
        style: TextButton.styleFrom(
            padding: const EdgeInsets.symmetric(vertical: 13),
            backgroundColor: AppColors.c_2C2C73,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(100))),
        onPressed: onTap,
        child: Text(
          title,
          style: AppTextStyle.rubikSemiBold.copyWith(
            fontSize: 16,
            color: AppColors.white,
          ),
        ),
      ),
    );
  }
}
