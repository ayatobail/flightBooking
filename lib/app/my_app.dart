import 'package:bot_toast/bot_toast.dart';
import 'package:flight_booking_app/ui/views/notification_view/notification_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flight_booking_app/core/enums/connectivity_status.dart';
import 'package:flight_booking_app/core/translation/app_translation.dart';
import 'package:flight_booking_app/core/utils/general_utils.dart';
import 'package:flight_booking_app/ui/shared/colors.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import '../core/themes/app_themes.dart';
import '../ui/views/splash_screen/splash_screen.dart';

late BuildContext appContext;

class MyApp extends StatefulWidget {
  const MyApp({super.key, required this.navigatorKey, });
  final GlobalKey<NavigatorState> navigatorKey;
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  @override
  Widget build(BuildContext context) {
    appContext = context;

    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: AppColors.transparentColor,
      statusBarIconBrightness: Brightness.light,
    ));
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

    return StreamProvider<ConnectivityStatus>(
      initialData: ConnectivityStatus.ONLINE,
      create: (context) =>
          connectivityService.connectivityStatusController.stream,
      child: GetMaterialApp(
        textDirection: languageService.getLocale() == Locale('ar', 'SA')
            ? TextDirection.rtl
            : TextDirection.ltr,
        defaultTransition: Transition.circularReveal,
        transitionDuration: Duration(milliseconds: 12),
        title: 'flight_booking',
        builder: BotToastInit(),
        locale: languageService.getLocale(),
        fallbackLocale: languageService.getLocale(),
        translations: AppTranslation(), //1. call BotToastInit
        navigatorObservers: [BotToastNavigatorObserver()],
        debugShowCheckedModeBanner: false,
        scrollBehavior: ScrollBehavior().copyWith(overscroll: false),
        theme: appThemeData[AppTheme.lightTheme],
        navigatorKey: widget.navigatorKey,
        routes: {'/second':(context)=>NotificationView()},
        home: SplashScreen(),
      ),
    );
  }
}
