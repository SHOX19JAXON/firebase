import 'package:firebase/view_models/login_view_model.dart';
import 'package:firebase/screens/widget/password_text_input.dart';
import 'package:firebase/screens/widget/simple_global_button.dart';
import 'package:firebase/screens/widget/universal_text_input.dart';
import 'package:firebase/utils/images/app_images.dart';
import 'package:firebase/utils/project_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

import '../../utils/colors/app_colors.dart';
import '../../utils/constants/app_constant.dart';
import '../../utils/styles/app_text_style.dart';
import 'login_screen.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final formKey = GlobalKey<FormState>();

  final TextEditingController usernameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  bool passwordVisibility = false;

  @override
  void dispose() {
    usernameController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: AppColors.white,
      body: context.watch<auth_view_model>().loading ? const Center(child: CircularProgressIndicator()):
      Padding(
        padding: EdgeInsets.symmetric(horizontal: 32.w()),
        child: Form(
          autovalidateMode: AutovalidateMode.always,
          key: formKey,
          child: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 25.h(),
                      ),
                      Text(
                        "Create your account!",
                        style: AppTextStyle.rubikBold.copyWith(
                          color: AppColors.c_2C2C73,
                          fontSize: 24,
                        ),
                      ),
                      SizedBox(height: 24.h()),
                      UniversalTextField(
                        labelText: "Your name",
                        errorText: "Ismni to'g'ri  kiriting!",
                        regExp: AppConstants.textRegExp,
                        controller: usernameController,
                        iconPath: AppImages.sms,
                        hintText: "Your Name",
                        type: TextInputType.text,
                      ),
                      SizedBox(height: 8.h()),
                      UniversalTextField(
                        labelText: "Mobile number",
                        errorText: "Telefon raqamni to'g'ri  kiriting!",
                        regExp: AppConstants.phoneRegExp,
                        controller: phoneController,
                        iconPath: "",
                        hintText: "Mobile Number",
                        type: TextInputType.phone,
                      ),
                      SizedBox(height: 8.h()),
                      UniversalTextField(
                        errorText: "Emailni to'g'ri  kiriting!",
                        regExp: AppConstants.emailRegExp,
                        controller: emailController,
                        iconPath: "",
                        hintText: "Email",
                        type: TextInputType.emailAddress,

                      ),
                      PasswordTextField(
                        controller: passwordController,
                        iconPath: "",

                        isVisible: passwordVisibility,
                        suffix: IconButton(
                          onPressed: () {
                            passwordVisibility = !passwordVisibility;
                            setState(() {});
                          },
                          icon: Icon(
                            passwordVisibility
                                ? Icons.visibility
                                : Icons.visibility_off,
                          ),
                        ),
                      ),
                      SizedBox(height: 24.h()),
                      SimpleGlobalButton(
                        onTap: () {
                          context.read<auth_view_model>().registerUser(
                            context,
                            email: emailController.text,
                            password: passwordController.text,
                            username: usernameController.text,
                          );

                          bool validated = formKey.currentState!.validate();
                          if (validated) {
                            ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(content: Text("SUCCESS!")));

                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                backgroundColor: Colors.red,
                                content: Text(
                                  "ERROR!",
                                  style: AppTextStyle.rubikSemiBold
                                      .copyWith(color: AppColors.white),
                                ),
                              ),
                            );
                          }
                        },
                        title: "REGISTER",
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
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return LoginScreen();
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
                      "Already have an account? Login",
                      style: AppTextStyle.rubikSemiBold.copyWith(
                        fontSize: 14,
                        color: AppColors.c_2C2C73
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
