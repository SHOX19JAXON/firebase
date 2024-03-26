import 'package:firebase/data/models/natification.dart';
import 'package:flutter/cupertino.dart';



class NotificationViewModel extends ChangeNotifier {
  List<NatificationModel> natification = [];


  List<NatificationModel> getNotifications() {
    return natification;

  }


  addMessage({required NatificationModel natificationModel}) {

    natification.add(natificationModel);
    debugPrint("${natification.length}");
    notifyListeners();
  }

  removeMessage({required NatificationModel natificationModel}) {
    natification.remove(natificationModel);
    notifyListeners();
  }

  removeAll() {
    natification = [];
    notifyListeners();
  }
}