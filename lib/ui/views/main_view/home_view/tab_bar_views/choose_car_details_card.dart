import 'package:flight_booking_app/core/utils/app_sizes.dart';
import 'package:flight_booking_app/ui/views/flight_views/flight_list_view/flight_list.dart';
import 'package:flight_booking_app/ui/views/main_view/home_view/home_controller.dart';

import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';

import '../../../../shared/app_colors.dart';
import '../../../../shared/custom_widgets/app_text_field.dart';
import '../../../../shared/custom_widgets/custom_button.dart';
import '../../../../shared/custom_widgets/depart_time.dart';
import '../../../../shared/custom_widgets/label_text.dart';

class ChooseCarDetailsCard extends StatefulWidget {
  const ChooseCarDetailsCard({super.key});

  @override
  State<ChooseCarDetailsCard> createState() => _ChooseCarDetailsCardState();
}

class _ChooseCarDetailsCardState extends State<ChooseCarDetailsCard> {
  @override
  HomeController controller=HomeController();

  Widget build(BuildContext context) {
    return  Card(
      elevation: 4,
      color: Colors.white,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(18),
              topLeft: Radius.circular(18))),
      child: SizedBox(
        width: double.infinity,
        child: Column(
          // mainAxisSize: MainAxisSize.max,
          // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          // crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    LabelText(
                      labelText: 'Pick-up Location',
                      padding: 25,
                    ),
                    AppTextField(
                      width: context.width * 0.35,
                    ),
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    LabelText(
                      labelText: 'Drop-off Location',
                      padding: 25,
                    ),
                    AppTextField(
                      width: context.width * 0.35,
                    ),
                  ],
                ),
              ],
            ),

            Row(
              children: [
                Column(
                  children: [
                    const LabelText(
                      labelText: 'Pick-up date',
                      padding: 20,
                    ),

                    Row(
                      mainAxisAlignment:MainAxisAlignment.start,
                      children: [
                         DepartTimeComponent(controller: controller,),
                      ],
                    ),
                  ],
                ),
                Column(
                  children: [
                    const LabelText(
                      labelText: 'Drop-off date',
                      padding: 20,
                    ),

                    Row(
                      mainAxisAlignment:MainAxisAlignment.start,
                      children: [
                         DepartTimeComponent(controller: controller,),
                      ],
                    ),
                  ],
                ),
              ],
            ),
            CheckboxListTile(value: true, onChanged: (val){},title: Text('Driver aged between 30 - 65 ?'),activeColor: AppColors.primaryColor,),
            LabelText(
              labelText: 'Price per hour ?',
              padding: 25,
            ),
            RangeSlider(values:RangeValues(0.1,1), onChanged: (rangeVal){},activeColor: AppColors.primaryColor,labels: RangeLabels('\$', '\$')),

            Padding(
              padding: EdgeInsets.symmetric(vertical: 12),
              child: AppButton(
                  onTap: () {
                           Get.to(FlightList(places: [], from: '', to: '',));
                  },color: AppColors.secondaryColor,
                  buttonText: 'Search cars'),
            ),
          ],
        ),
      ),
    );
  }
}
