import 'package:flight_booking_app/core/utils/general_utils.dart';
import 'package:flight_booking_app/ui/shared/app_colors.dart';
import 'package:flight_booking_app/ui/shared/custom_widgets/custom_text.dart';
import 'package:flight_booking_app/ui/shared/extensions/custom_sized_box_shared.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';

import '../../shared/custom_widgets/app_text_field.dart';
import '../../shared/custom_widgets/custom_button.dart';
import '../../shared/custom_widgets/label_text.dart';
import '../../shared/views_components/utils.dart';
class EditProfileView extends StatefulWidget {
  const EditProfileView({Key? key}) : super(key: key);

  @override
  _EditProfileViewState createState() => _EditProfileViewState();
}

class _EditProfileViewState extends State<EditProfileView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title:Text('Edit Profile')),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: screenWidth(17)),
        child: Form(
          //key: controller.formKey,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.only(
                      top: screenWidth(8),
                      bottom: screenWidth(60),
                      start: screenWidth(50)),
                  child:  LabelText(
                    labelText: 'Your name',
                    padding: 30,
                  ),
                ),
                AppTextField(
                  hintText: storage.getTokenInfo()!.name??"",
                  color: AppColors.primaryColor,
                ),
                Padding(
                  padding: EdgeInsetsDirectional.only(
                      top: screenWidth(30),
                      bottom: screenWidth(60),
                      start: screenWidth(50)),
                  child:  LabelText(
                    labelText: 'Your password',
                    padding: 30,
                  ),
                ),
                AppTextField(
                  hintText: storage.getTokenInfo()!.phone.toString()??"",
                ),
                (screenWidth(5)).ph,
          AppButton(
              onTap: () {},
              buttonText: 'save changes',
          ),
                (screenWidth(50)).ph,
                Center(
                  child: InkWell(
                      onTap: () => Get.back(),
                      child:CustomText(textType: TextStyleType.CUSTOM,fontSize: screenWidth(20),text: "Back",),),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

