import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';

import '../../../data/api_provider/api_provider.dart';
import '../../../services/local_notification_service.dart';
import '../../../utils/styles/app_text_style.dart';


class PushNotificationScreen extends StatefulWidget {
  const PushNotificationScreen({super.key});

  @override
  State<PushNotificationScreen> createState() => _PushNotificationScreenState();
}

class _PushNotificationScreenState extends State<PushNotificationScreen> {
  String fcmToken = "";

  void init() async {
    fcmToken = await FirebaseMessaging.instance.getToken() ?? "";
    debugPrint("FCM TOKEN:$fcmToken");
    final token = await FirebaseMessaging.instance.getAPNSToken();
    debugPrint("getAPNSToken : ${token.toString()}");
    LocalNotificationService.localNotificationService;
    //Foreground
    FirebaseMessaging.onMessage.listen(
          (RemoteMessage remoteMessage) {
        if (remoteMessage.notification != null) {
          LocalNotificationService().showNotification(
            title: remoteMessage.notification!.title!,
            body: remoteMessage.notification!.body!,
            id: DateTime.now().second.toInt(),
          );

          debugPrint(
              "FOREGROUND NOTIFICATION:${remoteMessage.notification!.title}");
        }
      },
    );
    //Background
    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage remoteMessage) {
      debugPrint("ON MESSAGE OPENED APP:${remoteMessage.notification!.title}");
    });
    // Terminated
    FirebaseMessaging.instance.getInitialMessage().then((message) {
      if (message != null) {
        debugPrint("TERMINATED:${message.notification?.title}");
      }
    });
  }

  @override
  void initState() {
    init();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Push Notifications Example"),
      ),
      body: Container(
        padding: const EdgeInsets.all(24),
        width: double.infinity,
        child: SingleChildScrollView(
          child: Column(
            children: [


              TextButton(
                onPressed: () {
                  FirebaseMessaging.instance.subscribeToTopic("my_app_news");
                },
                child: Text(
                  "Subscribe to topic: my_app_news",
                  style: AppTextStyle.rubikSemiBold.copyWith(
                    fontSize: 24,
                  ),
                ),
              ),
              TextButton(
                onPressed: () {
                  FirebaseMessaging.instance.unsubscribeFromTopic("my_app_news");
                },
                child: Text(
                  "Unsubscribe from topic: my_app_news",
                  style: AppTextStyle.rubikSemiBold.copyWith(
                    fontSize: 24,
                  ),
                ),
              ),
              TextButton(
                onPressed: () async {
                  String messageId = await ApiProvider().sendNotificationToUsers(
                    fcmToken: fcmToken,
                    title: "Bu test notification",
                    body: "Yana test notiifcation",
                  );
                  debugPrint("MESSAGE ID:$messageId");
                },
                child: Text(
                  "SEND MESSAGE TO USER",
                  style: AppTextStyle.rubikSemiBold.copyWith(
                    fontSize: 24,
                  ),
                ),
              ),
              TextButton(
                onPressed: () async {
                  String messageId = await ApiProvider().sendNotificationToUsers(
                    topicName: "news",
                    title: "Bu test notification",
                    body: "Yana test notiifcation",
                  );
                  debugPrint("MESSAGE ID:$messageId");
                },
                child: Text(
                  "SEND MESSAGE TO USERS",
                  style: AppTextStyle.rubikSemiBold.copyWith(
                    fontSize: 24,
                  ),
                ),
              ),
              TextButton(
                onPressed: ()  {
                  // Navigator.push(context, MaterialPageRoute(builder: (context){
                  //   return PushsNotificationScreen();
                  // }));


                },
                child: Text(
                  "PUSH Notification",
                  style: AppTextStyle.rubikSemiBold.copyWith(
                    fontSize: 24,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
