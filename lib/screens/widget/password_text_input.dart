import 'package:firebase/utils/colors/app_colors.dart';
import 'package:firebase/utils/project_extensions.dart';
import 'package:firebase/utils/styles/app_text_style.dart';
import 'package:flutter/material.dart';

import 'package:flutter_svg/flutter_svg.dart';

import '../../utils/constants/app_constant.dart';

class PasswordTextField extends StatelessWidget {
  const PasswordTextField({
    super.key,
    required this.controller,
    required this.iconPath,
    required this.isVisible,
    required this.suffix,
  });

  final TextEditingController controller;
  final String iconPath;
  final bool isVisible;
  final Widget suffix;

  @override
  Widget build(BuildContext context) {

    // kamida 8 ta simvol
    // Kamida bitta Katta harf
    // Kamida nitta son
    // Kmaida bitta kichik harfdagi simvol

    return TextFormField(
      controller: controller,
      obscureText: !isVisible,
      style: AppTextStyle.rubikSemiBold,
      validator: (String? value) {
        if (value == null || value.isEmpty || !AppConstants.passwordRegExp
            .hasMatch(value)) {
          return "To'gri parol kiriting!";
        } else {
          return null;
        }
      },
      //autovalidateMode: AutovalidateMode.always,
      decoration: InputDecoration(
        errorStyle: AppTextStyle.rubikSemiBold.copyWith(color: Colors.red),
        contentPadding: EdgeInsets.symmetric(
          vertical: iconPath.isNotEmpty ? 16.h() : 8.h(),
          horizontal: 1.h(),
        ),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: AppColors.c_090F47.withOpacity(0.3),
          ),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: AppColors.c_090F47.withOpacity(0.3),
          ),
        ),
        prefixIcon: iconPath.isNotEmpty
            ? Padding(
                padding: const EdgeInsets.fromLTRB(0, 8, 8, 8),
                child: SvgPicture.asset(iconPath),
              )
            : null,
        suffix: suffix,
        hintText: "Password",
        hintStyle: AppTextStyle.rubikSemiBold.copyWith(
          fontSize: 15,
          color: AppColors.c_090F47.withOpacity(0.45),
        ),
      ),
    );
  }
}
