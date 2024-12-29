import 'package:flight_booking_app/core/themes/app_colors.dart';
import 'package:flight_booking_app/core/utils/app_sizes.dart';
import 'package:flight_booking_app/core/utils/general_utils.dart';
import 'package:flight_booking_app/ui/shared/custom_widgets/colored_text.dart';
import 'package:flight_booking_app/ui/shared/custom_widgets/custom_text.dart';
import 'package:flight_booking_app/ui/shared/extensions/custom_sized_box_shared.dart';
import 'package:flight_booking_app/ui/views/edit_profile_view/edit_profile_view.dart';
import 'package:flight_booking_app/ui/views/profile_view/profile_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/get_core.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import '../../shared/custom_widgets/custom_button.dart';
import '../../shared/views_components/settings_components/setting_listtile.dart';
import '../../shared/views_components/settings_components/setting_section.dart';
import '../../shared/views_components/utils.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({Key? key}) : super(key: key);

  @override
  _ProfileViewState createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  //ProfileController controller = Get.put(ProfileController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Personal Info'),
      ),
      body: SingleChildScrollView(child:  Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Material(
              borderRadius:BorderRadius.circular(screenWidth(1)) ,
              elevation: 7,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(screenWidth(1)),
                child: Image(
                    image: ResizeImage(AssetImage("assets/images/flight.jpg"),
                        width: 115, height: 115)),
              ),
            ),
            CustomText(textType: TextStyleType.CUSTOM,fontSize: screenWidth(15), text: storage.getTokenInfo()!.name??""),
            SettingSection(
              label: ' ',
              settingList: [
                SettingListTile(
                    icon: Icons.person_outlined,
                    title: storage.getTokenInfo()!.name??"",
                    trailing: SizedBox()),
                SettingListTile(
                  icon: Icons.email_outlined,
                  title: storage.getTokenInfo()!.email??"",
                  trailing: SizedBox(),
                ),
                SettingListTile(
                    icon: Icons.phone_enabled_outlined,
                    title: storage.getTokenInfo()!.phone.toString()??"",
                    trailing: SizedBox()),
                SettingListTile(
                  icon: Icons.location_on_outlined,
                  title: 'Home,Syria',
                  trailing: SizedBox(),
                ),
              ],
            ),
            screenHeight(20).ph,
            AppButton(
              onTap: () => Get.to(EditProfileView()),
              buttonText: 'Edit Profile',
              btnWidth: context.width * 0.9,
            )
          ],
        )
      ),
    );
  }
}
