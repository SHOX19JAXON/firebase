import 'package:firebase/screens/register_screen.dart';
import 'package:firebase/screens/widget/password_text_input.dart';
import 'package:firebase/screens/widget/simple_global_button.dart';
import 'package:firebase/screens/widget/universal_text_input.dart';
import 'package:firebase/utils/project_extensions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../utils/colors/app_colors.dart';
import '../utils/images/app_images.dart';
import '../utils/styles/app_text_style.dart';


class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final formKey = GlobalKey<FormState>();

  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  void dispose() {
    usernameController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,

      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 32),
        child: Form(
          autovalidateMode: AutovalidateMode.always,
          key: formKey,
          child: Column(
            children: [
              SizedBox(height: 25.h(),),
              Expanded(child  : Image.asset(AppImages.img)),
              SizedBox(height: 25.h(),),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Welcome Back!",
                        style: AppTextStyle.rubikSemiBold.copyWith(
                          color: AppColors.c_29BB89,
                          fontSize: 24,
                        ),
                      ),
                      SizedBox(height: 24.h()),
                      UniversalTextField(

                        errorText: "Ismni to'g'ri  kiriting!",
                        regExp: RegExp("[a-zA-Z]"),
                        controller: usernameController,
                        iconPath: AppImages.sms,
                        hintText: "Username",
                        type: TextInputType.text,
                      ),
                      SizedBox(height: 16.h()),
                      PasswordTextField(
                        controller: passwordController,
                        iconPath: AppImages.log,
                        isVisible: false,
                        suffix: GestureDetector(
                          onTap: () {},
                          child: const Text("Forgot"),
                        ),
                      ),
                      SizedBox(height: 24.h()),
                      SimpleGlobalButton(
                        onTap: () {
                          bool validated = formKey.currentState!.validate();
                          print(validated);
                          if (validated) {
                            ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(content: Text("SUCCESS!")));
                          }
                        },
                        title: "LOGIN",
                        horizontalPadding: 0,
                      ),
                    ],
                  ),
                ),
              ),
              TextButton(
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return RegisterScreen();
                      },
                    ),
                  );
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.arrow_back_ios,
                      size: 12,
                      color: AppColors.c_29BB89.withOpacity(0.45),
                    ),
                    SizedBox(width: 8.h()),
                    Text(
                      "Don’t have an account? Sign Up",
                      style: AppTextStyle.rubikSemiBold.copyWith(
                        fontSize: 14,
                        color: AppColors.c_2C2C73.withOpacity(0.8),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
