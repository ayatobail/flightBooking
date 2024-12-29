import 'package:flight_booking_app/core/utils/general_utils.dart';
import 'package:flight_booking_app/ui/views/notification_view/notification_view.dart';
import 'package:flight_booking_app/ui/views/splash_screen/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flight_booking_app/app/my_app.dart';
import 'package:flight_booking_app/app/my_app_controller.dart';
import 'package:flight_booking_app/core/data/reposotories/shared_preferences_repository.dart';
import 'package:flight_booking_app/core/services/cart_services.dart';
import 'package:flight_booking_app/core/services/connectivity_service.dart';
import 'package:flight_booking_app/core/services/language_service.dart';
import 'package:flight_booking_app/core/services/package_info_service.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:firebase_core/firebase_core.dart';

import 'core/services/notification_service.dart';
import 'firebase_options.dart';

Future<void> main() async {
  final GlobalKey<NavigatorState> navigatorKey=GlobalKey();
  WidgetsFlutterBinding.ensureInitialized();

  await Get.putAsync<SharedPreferences>(() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs;
  }); 
  await Get.put(SharedPreferencesRepository());
  Get.put(CartService());
  Get.put(ConnectivityService());
  await Get.put(LanguageService());
  Get.put(PackageInfoService());
  Get.put(MyAppController());

   try {
    await Firebase.initializeApp(
       options: DefaultFirebaseOptions.currentPlatform,
    );

     Get.put(NotificationService(navigatorKey));
   } catch (e) {
     print(e);
  }
  runApp( MyApp(navigatorKey: navigatorKey,));
}
