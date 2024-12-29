import 'package:flight_booking_app/app/my_app_controller.dart';
import 'package:flight_booking_app/core/data/reposotories/shared_preferences_repository.dart';
import 'package:flight_booking_app/core/enums/connectivity_status.dart';
import 'package:flight_booking_app/core/enums/message_type.dart';
import 'package:flight_booking_app/core/services/cart_services.dart';
import 'package:flight_booking_app/core/services/connectivity_service.dart';
import 'package:flight_booking_app/core/services/language_service.dart';
import 'package:flight_booking_app/core/services/notification_service.dart';
import 'package:flight_booking_app/core/services/package_info_service.dart';
import 'package:flight_booking_app/ui/shared/custom_widgets/custom_toast.dart';
import 'package:get/get.dart';

ConnectivityService get connectivityService => Get.find<ConnectivityService>();

SharedPreferencesRepository get storage =>
    Get.find<SharedPreferencesRepository>();
CartService get cartService => Get.find<CartService>();
NotificationService get notificationService => Get.find<NotificationService>();
LanguageService get languageService => Get.find<LanguageService>();
PackageInfoService get packageInfoService => Get.find<PackageInfoService>();

// Future claunchUrl(Uri url) async {
//   if (!await launchUrl(
//     url,
//     // mode: LaunchMode.externalApplication,
//   )) {
//     CustomToast.showMessage(
//         message: 'cant launch url', messageType: MessageType.REJECTED);
//   }
// }

double get taxAmount => 0.18;
double get deliverAmount => 0.1;

//when value change change
bool get isOnline =>
    Get.find<MyAppController>().connectivityStatus == ConnectivityStatus.ONLINE;

bool get isOffline =>
    Get.find<MyAppController>().connectivityStatus ==
    ConnectivityStatus.OFFLINE;
//return note
//func bool and  toast
void checkConnection(Function function) {
  if (isOnline)
    //easy
    function();
  else
    showNoConnectionMessage();
}

void showNoConnectionMessage() {
  CustomToast.showMessage(
      message: 'Please check internet connection',
      messageType: MessageType.WARNING);
}
