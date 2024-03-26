import 'package:firebase/screens/auth_screens/register_screen.dart';
import 'package:firebase/screens/widget/password_text_input.dart';
import 'package:firebase/screens/widget/simple_global_button.dart';
import 'package:firebase/screens/widget/universal_text_input.dart';
import 'package:firebase/utils/project_extensions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

import '../../view_models/login_view_model.dart';
import '../../utils/colors/app_colors.dart';
import '../../utils/images/app_images.dart';
import '../../utils/styles/app_text_style.dart';
import '../routes.dart';


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

      body: context.watch<auth_view_model>().loading
          ? const Center(child: CircularProgressIndicator()):

      Padding(
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
                          color: AppColors.c_2C2C73,
                          fontSize: 24,
                        ),
                      ),
                      SizedBox(height: 24.h()),
                      UniversalTextField(

                        errorText: "Mailni to'g'ri  kiriting!",
                        regExp: RegExp("[a-zA-Z]"),
                        controller: usernameController,
                        iconPath: AppImages.sms,
                        hintText: "Mail ",
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
                          context.read<auth_view_model>().loginUser(
                            context,
                            email: usernameController.text,
                            password: passwordController.text,
                          );
                        },
                        title: "LOGIN",
                        horizontalPadding: 0, verticalPadding: 0,
                      ),
                      SizedBox(height: 25.h(),),
                      Row(

                        children: [
                          Spacer(),
                          // Expanded(child: Image.asset(AppImages.aple2,width: 10,height: 10,)),
                          IconButton(
                            onPressed: (){},
                            icon: SvgPicture.asset(AppImages.google),
                          ),Spacer(),
                          IconButton(
                            onPressed: (){},
                            icon: SvgPicture.asset(AppImages.fasebook),
                          ),
                          Spacer(),
                          IconButton(
                            onPressed: (){},
                            icon: SvgPicture.asset(AppImages.iphone),
                          ),
                          Spacer(),
                          // Image.asset(AppImages.google,width: 10,),
                          // Image.asset(AppImages.fasbooke,width: 10,),
                        ],),
                    ],
                  ),
                ),
              ),
              TextButton(
                onPressed: () {
                  Navigator.pushReplacementNamed(
                    context,
                    RouteNames.registerRoute,
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
