import 'package:firebase/utils/images/app_images.dart';
import 'package:firebase/utils/project_extensions.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import '../../../view_models/login_view_model.dart';
import '../../../utils/colors/app_colors.dart';
import '../../../utils/styles/app_text_style.dart';
import '../../widget/simple_global_button.dart';
import 'account_information/account_information.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    User? user = context.watch<auth_view_model>().getUser;

    return Scaffold(
        appBar: AppBar(
          title: const Text("Profile"),
          actions: [
            IconButton(
              onPressed: () {
                context.read<auth_view_model>().logout(context);
              },
              icon: const Icon(Icons.logout),
            ),
          ],
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 25.w(), vertical: 15.h()),
          child: Column(
            children: [
              Row(
                children: [
                  Image.asset(
                    AppImages.profil2,
                    width: 60.w(),
                    height: 60.h(),
                  ),

                  SizedBox(
                    width: 15.w(),
                  ),
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Umar Axmatov",
                        style: TextStyle(color: Colors.black, fontSize: 24),
                      ),
                      Text(
                        "Pro ACCOUNT",
                        style: TextStyle(color: Colors.blue),
                      ),
                    ],
                  )
                ],
              ),
              SizedBox(
                height: 30.h(),
              ),
              ...List.generate(
                profilSettings.length,
                (index) => SimpleGlobalButton(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return AccountInformation();
                    }));
                  },
                  title: profilSettings[index],
                  horizontalPadding: 0.w(),
                  verticalPadding: 10.h(),
                ),
              ),
              SizedBox(
                height: 20,
              ),

              Container(
                decoration: BoxDecoration(
                    // color: AppColors.c_2C2C73,
                    borderRadius: BorderRadius.circular(20.w())),
                child: TextButton(
                  onPressed: () {


                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: Text(
                              'Ogoxlantrish!!!',
                              style: TextStyle(
                                color: Colors.red,
                                fontSize: 20.w(),
                                fontWeight: FontWeight.w900,
                              ),
                              textAlign: TextAlign.center,
                            ),
                            content: Text(
                              'Ishonchingiz komilmi???',
                              style: TextStyle(
                                color: Colors.lightBlueAccent,
                                fontSize: 18.w(),
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            actions: <Widget>[
                              Row(
                                mainAxisAlignment:
                                MainAxisAlignment
                                    .spaceBetween,
                                children: [
                                  TextButton(
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                    child: Text("Yo'q"),
                                  ),
                                  TextButton(
                                    onPressed: () async {
                                      context.read<auth_view_model>().logout(context);

                                    },
                                    child: Text('Ha'),
                                  ),
                                ],
                              )
                            ],
                          );
                        },
                      );


                  },
                  child: const Text(
                    "Sign Out",
                    style: TextStyle(color: Colors.red),
                  ),
                ),
              )
            ],
          ),
        ));
  }
}

List<String> profilSettings = [
  "Order",
  "Returns and refunds",
  "Account information",
  "Security and settings",
  "Help"
];
