import 'package:flutter/cupertino.dart';
import 'package:permission_handler/permission_handler.dart';

class AppPermissions {
  static getStoragePermission() async {
    PermissionStatus status = await Permission.storage.status;
    debugPrint("STORAGE STATUS:$status");
    if (status.isDenied) {
      PermissionStatus status = await Permission.storage.request();
      debugPrint("STORAGE STATUS AFTER ASK:$status");
    }
  }

  static getCameraPermission() async {
    PermissionStatus status = await Permission.camera.status;
    debugPrint("CAMERA STATUS:$status");
    if (status.isDenied) {
      PermissionStatus status = await Permission.camera.request();
      debugPrint("CAMERA STATUS AFTER ASK:$status");
    }
  }

  static getLocationPermission() async {
    PermissionStatus status = await Permission.location.status;
    debugPrint("LOCATION STATUS:$status");
    if (status.isDenied) {
      PermissionStatus status = await Permission.location.request();
      debugPrint("LOCATION STATUS AFTER ASK:$status");
    }
  }

  static getContactsPermission() async {
    PermissionStatus status = await Permission.contacts.status;
    debugPrint("CONTACT STATUS:$status");
    if (status.isDenied) {
      PermissionStatus status = await Permission.contacts.request();
      debugPrint("CONTACT STATUS AFTER ASK:$status");
    }
  }
  static getbluetoothConnect() async {
    PermissionStatus status = await Permission.bluetoothConnect.status;
    debugPrint("Bluetooth Connect:$status");
    if (status.isDenied) {
      PermissionStatus status = await Permission.bluetoothConnect.request();
      debugPrint("Bluetooth Connect AFTER ASK:$status");
    }
  }
  static getCccessMediaLocation() async {
    PermissionStatus status = await Permission.accessMediaLocation.status;
    debugPrint("Access MediaLocation:$status");
    if (status.isDenied) {
      PermissionStatus status = await Permission.accessMediaLocation.request();
      debugPrint("Access MediaLocation AFTER ASK:$status");
    }
  }

  static getSms() async {
    PermissionStatus status = await Permission.sms.status;
    debugPrint("Sms:$status");
    if (status.isDenied) {
      PermissionStatus status = await Permission.sms.request();
      debugPrint("Sms AFTER ASK:$status");
    }
  }

  static getAudio() async {
    PermissionStatus status = await Permission.audio.status;
    debugPrint("Audio:$status");
    if (status.isDenied) {
      PermissionStatus status = await Permission.audio.request();
      debugPrint("Audio ASK:$status");
    }
  }
  static getActivityRecognition() async {
    PermissionStatus status = await Permission.activityRecognition.status;
    debugPrint("Activity Recognition:$status");
    if (status.isDenied) {
      PermissionStatus status = await Permission.activityRecognition.request();
      debugPrint("Activity Recognition ASK:$status");
    }
  }


  static getSomePermissions() async {
    List<Permission> permissions = [

      Permission.notification,
      Permission.sms,
      Permission.speech,
      Permission.videos,
      Permission.photos,
    ];
    Map<Permission, PermissionStatus> somePermissionsResults =
        await permissions.request();

    debugPrint(
        "NOTIFICATION STATUS AFTER ASK:${somePermissionsResults[Permission.notification]}");
    debugPrint(
        "SMS STATUS AFTER ASK:${somePermissionsResults[Permission.sms]}");
    debugPrint(
        " SPEECH AFTER ASK:${somePermissionsResults[Permission.speech]}");
    debugPrint(
        "Videos  AFTER ASK:${somePermissionsResults[Permission.videos]}");
    debugPrint(
        "Photos  AFTER ASK:${somePermissionsResults[Permission.photos]}");
  }
}
