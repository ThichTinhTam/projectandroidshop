import 'package:get/get.dart';

class NotificationController extends GetxController {
  RxBool hasUnreadNotification = false.obs;

  void updateUnreadNotificationStatus(List<bool> dotVisibility) {
    hasUnreadNotification.value = dotVisibility.any((visible) => visible);
  }
}