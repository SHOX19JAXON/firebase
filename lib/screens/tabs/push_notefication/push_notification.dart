

import 'package:firebase/screen.dart';
import 'package:firebase/utils/colors/app_colors.dart';
import 'package:firebase/utils/project_extensions.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../data/api_provider/api_provider.dart';
import '../../../data/models/natification.dart';
import '../../../services/local_notification_service.dart';
import '../../../utils/styles/app_text_style.dart';
import '../../../utils/utilities.dart';
import '../../../view_models/newes_view_model.dart';

class PushNotification extends StatefulWidget {
  const PushNotification({super.key});

  @override
  State<PushNotification> createState() => _PushNotificationState();
}

class _PushNotificationState extends State<PushNotification> {
  int son = 1;
  String fcmToken = "";

  _init() async {
    String? fcmToken = await FirebaseMessaging.instance.getToken();
    debugPrint("FCM TOKEN ${fcmToken}");
    FirebaseMessaging.onMessage.listen((remoteMessage) {
      debugPrint(
          "Push notification keldiku☺️ => ${remoteMessage.notification!.title}");
      if (remoteMessage.notification != null) {
        print(son++);
        son++;
        LocalNotificationService().showNotification(
            title: remoteMessage.notification!.title!,
            body: remoteMessage.notification!.body!,
            id: son);
      }
    });
  }

  @override
  void initState() {
    _init();
    super.initState();
  }

  String title = "";
  String body = "";

  @override
  Widget build(BuildContext context) {
    var a = context
        .read<NewsViewModel>().getPushNotifications();
    return Scaffold(
      appBar: AppBar(
        title: const Text("PUSH notification"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(
              style: TextStyle(color: Colors.black),
              textInputAction: TextInputAction.done,
              onChanged: (v) {
                title = v;
              },
              decoration: InputDecoration(
                  floatingLabelBehavior: FloatingLabelBehavior.always,
                  fillColor: Colors.white,
                  filled: true,
                  hintMaxLines: 4,
                  contentPadding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
                  hintText: "title",
                  hintStyle: const TextStyle(color: Colors.black, fontSize: 14),
                  enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.black),
                      borderRadius: BorderRadius.circular(12)),
                  disabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.black),
                      borderRadius: BorderRadius.circular(12)),
                  focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: AppColors.black),
                      borderRadius: BorderRadius.circular(12))),
            ),
            SizedBox(
              height: 20,
            ),
            TextField(
              style: TextStyle(color: Colors.black),
              textInputAction: TextInputAction.done,
              onChanged: (v) {
                body = v;
              },
              decoration: InputDecoration(
                  floatingLabelBehavior: FloatingLabelBehavior.always,
                  fillColor: Colors.white,
                  filled: true,
                  hintMaxLines: 4,
                  contentPadding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
                  hintText: "body",
                  hintStyle: const TextStyle(color: Colors.black, fontSize: 14),
                  enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.black),
                      borderRadius: BorderRadius.circular(12)),
                  disabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.black),
                      borderRadius: BorderRadius.circular(12)),
                  focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: AppColors.black),
                      borderRadius: BorderRadius.circular(12))),
            ),
            TextButton(onPressed: () {}, child: Text(" user")),
            TextButton(
              onPressed: () {
                TextButton(
                    style: TextButton.styleFrom(
                        padding: EdgeInsets.symmetric(
                            vertical: 16.h(), horizontal: 40.w()),
                        backgroundColor: AppColors.c_2C2C73,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15))),
                    onPressed: () async {


                      //------------------------------LocalNotification----------------------------------
                      NatificationModel notification = NatificationModel(
                          id: 1, name: "asddfsdf");

                      //------------------------------PushNotification----------------------------------
                      context
                          .read<NewsViewModel>()
                          .addPushNotification(notification);
                      String messageId =
                          await ApiProvider().sendNotificationToUsers(
                        fcmToken: fcmToken,
                        title: title,     //"Push ${notification.name}",
                        body: body,
                      );
                      debugPrint("MESSAGE ID:$messageId");

                      Navigator.pop(context);
                    },
                    child: Text(
                      "Push user",
                      style: AppTextStyle.rubikMedium
                          .copyWith(color: AppColors.white),
                    ));
                Navigator.push(context,MaterialPageRoute(builder: (context){return Screen1();}));
              },
              child: Text("push user"),
            ),
             // TextButton(onPressed: (){}, child: )
            ...List.generate(a.length, (index) => Text(a[index].name,style: TextStyle(color: Colors.red),))
          ],
        ),
      ),
    );
  }
}
