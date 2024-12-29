import 'package:flight_booking_app/core/utils/general_utils.dart';
import 'package:flight_booking_app/ui/views/main_view/my_tripes_view/my_tripes_view.dart';
import 'package:flight_booking_app/ui/views/main_view/my_tripes_view/my_trips_controller.dart';
import 'package:flight_booking_app/ui/views/main_view/settings_view/setting_controller.dart';
import 'package:flight_booking_app/ui/views/notification_view/notification_view.dart';
import 'package:flight_booking_app/ui/views/profile_view/profile_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../shared/views_components/settings_components/profile_card.dart';
import '../../../shared/views_components/settings_components/setting_listtile.dart';
import '../../../shared/views_components/settings_components/setting_section.dart';
import '../../splash_screen/splash_screen.dart';


class SettingsView extends StatefulWidget {
  const SettingsView({Key? key}) : super(key: key);

  @override
  _SettingsViewState createState() => _SettingsViewState();
}

class _SettingsViewState extends State<SettingsView> {
  MyTripsController myTripsController=MyTripsController();
  SettingController settingController=SettingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text('Settings'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                ProfileCard(),
                SettingSection(label: 'Profile', settingList: [
                  SettingListTile(icon: Icons.account_circle, title: 'Personal Information',
                    onTap: (){Get.to(ProfileView());},
                  ),
                  SettingListTile(icon: Icons.my_library_books_outlined, title: 'My Trips',onTap:() {Get.to(MyTripesView(controller: myTripsController));myTripsController.onInit();}),
                  //SettingListTile(icon: Icons.wallet_outlined, title: 'My wallet'),
                ]),
                SettingSection(label: 'Application', settingList: [
                 SettingListTile(icon: Icons.notifications_outlined, title: 'Notifications',onTap: ()=>Get.to(NotificationView(),),),
                 // SettingListTile(icon: Icons.language_outlined, title: 'Languages'),
                ]),
                SettingSection(label: 'Other', settingList: [
                 SettingListTile(icon: Icons.share_outlined, title: 'Share',onTap:() =>settingController.shareApp()),
                  SettingListTile(icon: Icons.privacy_tip_outlined,color: Colors.green, title: 'Privacy and Security'),
                  SettingListTile(icon: Icons.info_outline_rounded, title: 'About'),
                ]),

                SettingSection(label: ' ', settingList: [
                  SettingListTile(icon: Icons.logout_rounded, color: Colors.red,title: 'Log out',onTap: ()async{
                    storage.clearTokenInfo();
                    Get.off(SplashScreen());
                  }),
                ]),
                // SizedBox(height: context.height*0.05,)
              ],
            ),
          ],
        ),
      ),
    );
  }
}
