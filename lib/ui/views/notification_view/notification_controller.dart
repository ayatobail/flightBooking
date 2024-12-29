import 'package:flight_booking_app/core/data/reposotories/notification_repositories.dart';
import 'package:flight_booking_app/core/services/base_controller.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';

import '../../../core/data/models/notification_model.dart';
import '../../../core/enums/message_type.dart';
import '../../shared/custom_widgets/custom_toast.dart';

class NotificationController extends BaseController {
  RxList<NotificationModel> notifications = <NotificationModel>[].obs;

  void onInit() {
    getAllNotifications();
    super.onInit();
  }

  void getAllNotifications() {
    runFutureFunctionWithLoading(
        function:
            NotificationsRepositories().getAllNotifications().then((value) {
      value.fold((l) {
        CustomToast.showMessage(message: l, messageType: MessageType.REJECTED);
      }, (r) {
        notifications.clear();
        notifications.addAll(r);
      });
    }));
  }

  void readNotification(String notificationId) {
    runFutureFunctionWithLoading(
        function: NotificationsRepositories()
            .readNotification(notificationId: notificationId)
            .then((value) {
      value.fold((l) {
        CustomToast.showMessage(message: l, messageType: MessageType.REJECTED);
      }, (r) {
        getAllNotifications();
      });
    }));
  }
}
