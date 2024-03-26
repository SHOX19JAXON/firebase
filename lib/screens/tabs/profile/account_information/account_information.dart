import 'package:firebase/utils/project_extensions.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../view_models/login_view_model.dart';
import '../../../../utils/colors/app_colors.dart';
import '../../../../utils/images/app_images.dart';
import '../user_info_change/user_info_change.dart';
import 'account_itms/account_itms.dart';

class AccountInformation extends StatefulWidget {
  const AccountInformation({super.key});

  @override
  State<AccountInformation> createState() => _AccountInformationState();
}

class _AccountInformationState extends State<AccountInformation> {

  @override
  Widget build(BuildContext context) {

    User? user = context.watch<auth_view_model>().getUser;


    return Scaffold(
      appBar: AppBar(
        title: const Text("Account information"),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 25.w(), vertical: 15.h()),
        child: Column(
          children: [
            SizedBox(
              height: 10.h(),
            ),
            Image.asset(
              AppImages.profil2,
              width: 80.w(),
              height: 80.h(),
            ),
            Ink(
              decoration: BoxDecoration(
                  border: Border.all(
                width: 1,
                color: AppColors.c_2C2C73,
              )),
              child: InkWell(
                borderRadius: BorderRadius.circular(10),
                onTap: () {},
                child: const Text(
                  "Change Foto",
                  style: TextStyle(
                    color: AppColors.c_2C2C73,
                  ),
                ),
              ),
            ),
            ...List.generate(
                userInfo.length,
                (index) => AccountItem(
                      title: userInfo[index],
                      userInfo: "Axmat",
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return UserInfoChange();
                        }));
                      },
                    ))
          ],
        ),
      ),
    );
  }
}

List<String> userInfo = [
  "User name",
  "Email",
  "Phone number",
  "Password",
  "Account type"
];
