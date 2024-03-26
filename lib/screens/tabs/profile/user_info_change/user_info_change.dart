import 'package:firebase/utils/images/app_images.dart';
import 'package:firebase/utils/project_extensions.dart';
import 'package:flutter/material.dart';

import '../../../../utils/colors/app_colors.dart';
import '../../../../utils/constants/app_constant.dart';
import '../../../widget/universal_text_input.dart';

class UserInfoChange extends StatelessWidget {
  const UserInfoChange({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController usernameController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: const Text("Email"),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 25.w()),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Actual email adress",
              style: TextStyle(color: Colors.black),
            ),
            const Text(
              "Soroushnorozyui@gmail.com",
              style: TextStyle(
                color: AppColors.c_2C2C73,
              ),
            ),
            SizedBox(
              height: 25.h(),
            ),
            const Text(
              "New email adress",
              style: TextStyle(color: Colors.black),
            ),
            UniversalTextField(
              controller: usernameController,
              iconPath: AppImages.sms,
              hintText: "Mail",
              type: TextInputType.text,
              regExp: AppConstants.textRegExp,
              errorText: 'Mail',
            ),
            SizedBox(
              height: 25.h(),
            ),
            const Text(
              "Confirm email adress",
              style: TextStyle(color: Colors.black),
            ),
            UniversalTextField(
              controller: usernameController,
              iconPath: AppImages.sms,
              hintText: "Mail",
              type: TextInputType.text,
              regExp: AppConstants.textRegExp,
              errorText: 'Mail',
            ),
          ],
        ),
      ),
    );
  }
}
