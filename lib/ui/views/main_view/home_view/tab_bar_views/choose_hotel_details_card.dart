import 'package:flight_booking_app/core/utils/app_sizes.dart';
import 'package:flight_booking_app/ui/views/hotel_views/hotel_list_view/hotel_list_view.dart';
import 'package:flight_booking_app/ui/views/main_view/home_view/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';

import '../../../../shared/app_colors.dart';
import '../../../../shared/custom_widgets/app_text_field.dart';
import '../../../../shared/custom_widgets/custom_button.dart';
import '../../../../shared/custom_widgets/depart_time.dart';
import '../../../../shared/custom_widgets/label_text.dart';

class ChooseHotelDetailsCard extends StatefulWidget {
  const ChooseHotelDetailsCard({super.key});

  @override
  State<ChooseHotelDetailsCard> createState() => _ChooseHotelDetailsCardState();
}

class _ChooseHotelDetailsCardState extends State<ChooseHotelDetailsCard> {
  HomeController controller=HomeController();
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      color: Colors.white,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(18), topLeft: Radius.circular(18))),
      child: SizedBox(
        width: double.infinity,
        child: Column(
          // mainAxisSize: MainAxisSize.max,
          // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                LabelText(
                  labelText: 'Where are you going ?',
                  padding: 25,
                ),
                AppTextField(
                  width: context.width * 0.35,
                ),
              ],
            ),
            Row(
              children: [
                Column(
                  children: [
                    const LabelText(
                      labelText: 'Date',
                      padding: 20,
                    ),
                    DepartTimeComponent(controller: controller),
                  ],
                ),
                Column(
                  children: [
                    const LabelText(
                      labelText: 'Nights',
                      padding: 20,
                    ),
                    AppTextField(
                      width: context.width * 0.25,
                      inputType: TextInputType.number,
                    ),
                  ],
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                AppTextField(
                  labelText: 'guests',
                  width: context.width * 0.235,
                  inputType: TextInputType.number,
                  prefIcon: Icons.group_outlined,
                ),
                AppTextField(
                  width: context.width * 0.235,
                  inputType: TextInputType.number,
                  labelText: 'Kids',
                  prefIcon: Icons.person_outlined,
                ),
                AppTextField(
                  width: context.width * 0.235,
                  inputType: TextInputType.number,
                  labelText: 'rooms',
                  prefIcon: Icons.bedroom_parent_outlined,
                ),
              ],
            ),
            LabelText(
              labelText: 'Price per night ?',
              padding: 25,
            ),
            RangeSlider(
                values: RangeValues(0.1, 1),
                onChanged: (rangeVal) {},
                activeColor: AppColors.primaryColor,
                labels: RangeLabels('\$', '\$')),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 12),
              child: AppButton(
                  onTap: () {
                    Get.to(HotelListView());
                    //context.navigateTo(routeName: Routes.hotelListRoute);
                  },
                  buttonText: 'Search hotels'),
            ),
          ],
        ),
      ),
    );
  }
}
