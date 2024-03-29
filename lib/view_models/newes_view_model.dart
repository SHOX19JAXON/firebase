import 'package:flutter/foundation.dart';


import '../data/models/natification.dart';

class NewsViewModel extends ChangeNotifier {
  List<NatificationModel> pushNotifications = [];

  void addPushNotification(NatificationModel notification) {
    pushNotifications.add(notification);
    notifyListeners();
  }

  List<NatificationModel> getPushNotifications() {
    return pushNotifications;

  }

  void deletePushNotificationById(int id) {
    pushNotifications.removeWhere((notification) => notification.id == id);
    notifyListeners();
  }

  void deletePushAllNotifications() {
    pushNotifications=[];
    notifyListeners();

  }


}
