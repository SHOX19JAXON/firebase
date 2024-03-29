import 'package:firebase/utils/colors/app_colors.dart';
import 'package:firebase/utils/project_extensions.dart';
import 'package:flutter/material.dart';

import '../../utils/app_permissions.dart';
import '../routes.dart';

class PermissionsScreen extends StatefulWidget {
  const PermissionsScreen({super.key});

  @override
  State<PermissionsScreen> createState() => _PermissionsScreenState();
}

class _PermissionsScreenState extends State<PermissionsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Permissions")),
      body: Container(
        width: double.infinity,
        margin: const EdgeInsets.all(24),
        child: Padding(
          padding:  EdgeInsets.symmetric(horizontal: 20.h()),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: double.infinity,
                color: AppColors.c_2C2C73,
                child: TextButton(
                  onPressed: () {
                    AppPermissions.getStoragePermission();
                  },
                  child: const Text("STORAGE"),
                ),
              ),
              SizedBox(height: 8.h(),),
              Container(
                width: double.infinity,
                color: AppColors.c_2C2C73,
                child: TextButton(
                  onPressed: () {
                    AppPermissions.getCameraPermission();
                  },
                  child: const Text("CAMERA"),
                ),
              ),
              SizedBox(height: 8.h(),),
              Container(
                width: double.infinity,
                color: AppColors.c_2C2C73,
                child: TextButton(
                  onPressed: () {
                    AppPermissions.getLocationPermission();
                  },
                  child: const Text("LOCATION"),
                ),
              ),
              SizedBox(height: 8.h(),),
              Container(
                width: double.infinity,
                color: AppColors.c_2C2C73,
                child: TextButton(
                  onPressed: () {
                    AppPermissions.getContactsPermission();
                  },
                  child: const Text("CONTACTS"),
                ),
              ),
              SizedBox(height: 8.h(),),
              Container(
                width: double.infinity,
                color: AppColors.c_2C2C73,
                child: TextButton(
                  onPressed: () {
                    AppPermissions.getSomePermissions();
                  },
                  child: const Text("SOME PERMISSIONS"),
                ),
              ),
              SizedBox(height: 8.h(),),
              Container(
                width: double.infinity,
                color: AppColors.c_2C2C73,
                child: TextButton(
                  onPressed: () {
                    AppPermissions.getActivityRecognition();
                  },
                  child: const Text("Activity Recognition"),
                ),
              ),
              SizedBox(height: 8.h(),),
              Container(
                width: double.infinity,
                color: AppColors.c_2C2C73,
                child: TextButton(
                  onPressed: () {
                    AppPermissions.getAudio();
                  },
                  child: const Text("Audio"),
                ),
              ),
              SizedBox(height: 8.h(),),
              Container(
                width: double.infinity,
                color: AppColors.c_2C2C73,
                child: TextButton(
                  onPressed: () {
                    AppPermissions.getCccessMediaLocation();
                  },
                  child: const Text("Access MediaLocation"),
                ),
              ),
              SizedBox(height: 8.h(),),
              Container(
                width: double.infinity,
                color: AppColors.c_2C2C73,
                child: TextButton(
                  onPressed: () {
                    AppPermissions.getbluetoothConnect();
                  },
                  child: const Text("Bluetooth Connect "),
                ),
              ),
              SizedBox(height: 8.h(),),
              Container(
                width: double.infinity,
                color: AppColors.c_2C2C73,
                child: TextButton(
                  onPressed: () {
                    AppPermissions.getSms();
                  },
                  child: const Text("SMS "),
                ),
              ),
              SizedBox(height: 8.h(),),
              Container(
                width: double.infinity,
                color: AppColors.c_2C2C73,
                child: TextButton(
                  onPressed: () {
                    AppPermissions.getSomePermissions();
                  },
                  child: const Text("SOME PERMISSIONS"),
                ),
              ),
              SizedBox(height: 8.h(),),

              Container(
                width: double.infinity,
                color: AppColors.c_2C2C73,
                child: TextButton(
                  onPressed: () {
                    // Navigator.pushReplacementNamed(context, RouteNames.tabRoute);
                    Navigator.pushReplacementNamed(context, RouteNames.tabRoute);
                  },
                  child: const Text("Start ",style: TextStyle(color: Colors.red),),
                ),
              ),



            ],
          ),
        ),
      ),
    );
  }
}
