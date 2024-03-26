import 'package:firebase/utils/project_extensions.dart';
import 'package:flutter/material.dart';

import '../../../../../utils/colors/app_colors.dart';

class AccountItem extends StatelessWidget {
  const AccountItem(
      {super.key,
      required this.title,
      required this.userInfo,
      required this.onTap});

  final String title;
  final String userInfo;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 15.h()),
      child: Container(
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                blurRadius: 7,
                color: Colors.grey,
                offset: Offset(0, 12),
              ),
            ],
            color: AppColors.c_2C2C73,
            borderRadius: BorderRadius.circular(10.w()),
          ),
          child: Row(
            children: [
              Padding(
                padding:
                    EdgeInsets.symmetric(horizontal: 8.w(), vertical: 8.h()),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: TextStyle(
                        color: Colors.grey,
                      ),
                    ),
                    SizedBox(
                      height: 10.h(),
                    ),
                    Text(
                      userInfo,
                      style: const TextStyle(color: Colors.white),
                    ),
                  ],
                ),
              ),
              const Spacer(),
              Container(
                  decoration: BoxDecoration(
                    border: Border.all(width: 1, color: Colors.white),
                    // color: AppColors.c_2C2C73,
                    borderRadius: BorderRadius.circular(10.w()),
                  ),
                  child: TextButton(
                      onPressed: onTap,
                      child: const Text(
                        "Change",
                        style: TextStyle(color: Colors.white, fontSize: 12),
                      ))),
              SizedBox(
                width: 6.w(),
              )
            ],
          )),
    );
  }
}
