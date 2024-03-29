import 'package:firebase/data/models/natification.dart';
import 'package:flutter/foundation.dart';


class PushNotificationViewModel extends ChangeNotifier {
  List<PushNotificationModel> pushNotifications = [];

  void addNotification(PushNotificationModel pushNotificationModel) {
    pushNotifications.add(pushNotificationModel);
    notifyListeners();
  }

  List<PushNotificationModel> getNotifications() {
    return pushNotifications;

  }

  void deleteNotificationById(int id) {
    pushNotifications.removeWhere((pushNotificationModel) => pushNotificationModel.id == id);
    notifyListeners();
  }

  void deleteAllNotifications() {
    pushNotifications=[];
    notifyListeners();

  }

}
