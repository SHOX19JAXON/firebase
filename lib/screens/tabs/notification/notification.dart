import 'package:firebase/data/models/natification.dart';
import 'package:firebase/services/local_notification_service.dart';
import 'package:firebase/utils/colors/app_colors.dart';
import 'package:firebase/view_models/natification.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class Notification1 extends StatefulWidget {
  const Notification1({super.key});

  @override
  State<Notification1> createState() => _MessageScreenState();
}

class _MessageScreenState extends State<Notification1> {
  @override
  Widget build(BuildContext context) {
    final notificationView = Provider.of<NotificationViewModel>(context);
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: Text(
          "Natification",
          style: TextStyle(
            color: Colors.black,
            fontSize: 22.sp,
            fontWeight: FontWeight.w900,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              context.read<NotificationViewModel>().removeAll();
              LocalNotificationService.localNotificationService.cancelAll();
            },
            icon: const Icon(Icons.delete),
          ),
        ],
      ),
      body: Column(
        children: [

            ...List.generate(
              context.watch<NotificationViewModel>().natification.length,
              (index) {
                NatificationModel natificationModel =
                    context.watch<NotificationViewModel>().natification[index];

                print(natificationModel);
                return ListTile(
                  title: Container(
                      width: 50,
                      height: 20,
                      color: Colors.white,
                      child: Text(
                        natificationModel.name,
                        style: TextStyle(color: AppColors.black),
                      )),
                  subtitle: Text(natificationModel.id.toString()),
                  trailing: Container(
                    width: 50,
                    height: 20,
                    color: Colors.red,
                    child: IconButton(
                      onPressed: () {
                        LocalNotificationService.localNotificationService
                            .cancelNotification(natificationModel.id);
                        context.read<NotificationViewModel>().natification;
                      },
                      icon: const Icon(
                        Icons.delete,
                        color: Colors.black,
                      ),
                    ),
                  ),
                );
              },
            )
        ],
      ),
    );
  }
}
