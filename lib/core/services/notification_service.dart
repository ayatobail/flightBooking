import 'dart:async';
import 'package:flight_booking_app/core/data/reposotories/notification_repositories.dart';
import 'package:flight_booking_app/core/utils/general_utils.dart';
import 'package:flight_booking_app/ui/views/login_view/login_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import "package:get/get.dart";
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flight_booking_app/core/data/models/notification_model.dart';
import 'package:flight_booking_app/core/enums/app_state_enum.dart';
import 'package:flight_booking_app/ui/views/notification_view/notification_view.dart';
import 'package:get/utils.dart';
import 'package:firebase_core/firebase_core.dart';
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  // If you're going to use other Firebase services in the background, such as Firestore,
  // make sure you call `initializeApp` before using other Firebase services.
  await Firebase.initializeApp();

  Get.to(NotificationView());
}

class NotificationService {
  StreamController<NotificationModel> notifcationStream =
      StreamController<NotificationModel>.broadcast();
  final GlobalKey<NavigatorState> navigatorKey;
List<NotificationModel> notifications=[];
  NotificationService(this.navigatorKey) {
    onInit();
  }

  void onInit() async {


    // If the message also contains a data property with a "type" of "chat",
    // navigate to a chat screen

    if (GetPlatform.isIOS) {
      FirebaseMessaging messaging = FirebaseMessaging.instance;

      NotificationSettings settings = await messaging.requestPermission(
        alert: true,
        announcement: false,
        badge: true,
        carPlay: false,
        criticalAlert: false,
        provisional: false,
        sound: true,
      );

      if (settings.authorizationStatus == AuthorizationStatus.authorized) {
        await registerdFCMToken();
      } else {
        return;
      }
    } else {
      await registerdFCMToken();
    }

    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      NotificationModel model = NotificationModel.fromJson(message.data);
      handelNotification(model: model, appState: AppState.FOREGROUND);
    });

    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      NotificationModel model = NotificationModel.fromJson(message.data);
      handelNotification(model: model, appState: AppState.BACKGROUND);

    });
   /* FirebaseMessaging.instance.getInitialMessage().then((value) {
      NotificationModel model = NotificationModel.fromJson(value!.data);
      handelNotification(model: model, appState: AppState.TERMINATED);
    });*/

    FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

  }

  Future<void> registerdFCMToken() async {
    final fcmToken = await FirebaseMessaging.instance.getToken();
    NotificationsRepositories.updateNotifications(fcmToken);
    //! -- Call api that register fcm token ---

    FirebaseMessaging.instance.onTokenRefresh.listen((fcmToken) {
      NotificationsRepositories.updateNotifications(fcmToken);
      //! -- Call api that register fcm token ---

      // Note: This callback is fired at each app startup and whenever a new
      // token is generated.
    }).onError((err) {
      // Error getting token.
    });
  }

  void handelNotification(
      {required NotificationModel model, required AppState appState}) {
    notifications.add(model);
    notifcationStream.add(model);
    if(appState==AppState.TERMINATED){navigatorKey.currentState?.pushNamed('/second');}
    else
      storage.isLoggedIn?
      Get.to(NotificationView()):Get.to(LogInScreen());
     //if (mdel.notifctionType == NotificationType.SUBSCRIPTION.name) {
    // storage.setSubStatus(model.subStatus == "1" ? true : false);
    // }
  }
}
