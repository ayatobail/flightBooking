import 'dart:ffi';

import 'package:flight_booking_app/core/themes/app_colors.dart';
import 'package:flight_booking_app/core/utils/app_sizes.dart';
import 'package:flight_booking_app/ui/shared/custom_widgets/app_text_field.dart';
import 'package:flight_booking_app/ui/shared/custom_widgets/class_type.dart';
import 'package:flight_booking_app/ui/shared/custom_widgets/custom_button.dart';
import 'package:flight_booking_app/ui/shared/custom_widgets/label_text.dart';
import 'package:flight_booking_app/ui/shared/extensions/custom_sized_box_shared.dart';
import 'package:flight_booking_app/ui/shared/views_components/utils.dart';
import 'package:flight_booking_app/ui/views/main_view/home_view/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import '../../../../../shared/custom_widgets/app_drop_down.dart';
import '../../../../../shared/views_components/choose_locations_component.dart';
import '../../../../../shared/custom_widgets/depart_time.dart';

class SearchTripsView extends StatefulWidget {
  const SearchTripsView({super.key, this.isRoundTrip = false});

  final bool isRoundTrip;

  @override
  State<SearchTripsView> createState() => _SearchTripsViewState();
}

class _SearchTripsViewState extends State<SearchTripsView> {
  HomeController controller = HomeController();

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
        child: Form(
          key: controller.formKey1,
          child: Column(
            // mainAxisSize: MainAxisSize.max,
            children: [
              ChooseLocationsComponents(
                controller: controller,
              ),

              const LabelText(
                labelText: 'Depart',
                padding: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  DepartTimeComponent(
                    controller: controller,
                  ),
                  screenWidth(10).pw,
                  widget.isRoundTrip == true
                      ? DepartTimeComponent(
                          controller: controller,
                          isRound: true,
                        )
                      : Container(),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 12.0),
                child: const LabelText(
                  labelText: 'Passengers & Luggage',
                  padding: 20,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  /* AppTextField(
                    controller: controller.adultsController,
                    width: context.width * 0.235,
                    inputType: TextInputType.number,
                    labelText: 'adults',
                    prefIcon: Icons.group_outlined,
                  ),*/
                  AppDropDown(
                    items: [0, 1, 2, 3, 4, 5, 6, 7, 8],
                    width: context.width * 0.235,
                    rounded: 8.0,
                    color: AppColors.grey,
                    prefIcon: Icons.group_outlined,
                    labelText: "adults",
                    onChanged: (val) {
                      controller.adultsController.value = val.toString();
                    },
                  ),
                 // screenWidth(9).pw,
                  AppDropDown(
                    items: [0, 1, 2, 3, 4, 5, 6, 7, 8],
                    width: context.width * 0.235,
                    rounded: 8.0,
                    color: AppColors.grey,
                    prefIcon: Icons.group_outlined,
                    labelText: "kids",
                    onChanged: (val) {
                      controller.kidsController.value = val.toString();
                    },
                  ),
                  AppDropDown(
                    items: [0, 1, 2, 3, 4, 5, 6, 7, 8],
                    width: context.width * 0.235,
                    rounded: 8.0,
                    color: AppColors.grey,
                    prefIcon: Icons.group_outlined,
                    labelText: "infants",
                    onChanged: (val) {
                      controller.infantsController.value = val.toString();
                    },
                  ),
                  /* AppTextField(
                    controller: controller.kidsController,
                    width: context.width * 0.235,
                    inputType: TextInputType.number,
                    labelText: 'Kids',
                    prefIcon: Icons.person_outlined,
                  ),*/
                  /*AppTextField(
                    controller: controller.infantsController,
                    width: context.width * 0.235,
                    inputType: TextInputType.number,
                    labelText: 'kg',
                    prefIcon: Icons.luggage_outlined,
                  ),*/
                ],
              ),
              SizedBox(
                height: 12,
              ),
              const LabelText(
                labelText: 'Class',
                padding: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ClassType(
                    icon: Icons.airline_seat_recline_normal_outlined,
                    classType: 'Economy',
                    controller: controller,
                  ),
                  ClassType(
                    icon: Icons.airline_seat_recline_extra_outlined,
                    classType: 'Business',
                    controller: controller,
                  ),
                  ClassType(
                    icon: Icons.airline_seat_flat_angled_outlined,
                    classType: 'First',
                    controller: controller,
                  ),
                ],
              ),
              // SizedBox(
              //   height: context.height * 0.1,
              // ),
              Obx(() {
                return Padding(
                    padding: EdgeInsets.symmetric(vertical: 18),
                    child: controller.loader.value
                        ? CircularProgressIndicator(
                            color: AppColors.primaryColor,
                          )
                        : AppButton(
                            onTap: () {
                              widget.isRoundTrip
                                  ? controller.roundTrip()
                                  : controller.searchOneWayTrip();
                            },
                            buttonText: 'Search flights'));
              }),
              // Align(
              //     alignment: Alignment.bottomRight,
              //     child: FloatingActionButton(onPressed: (){},child: Icon(Icons.search),))
            ],
          ),
        ),
      ),
    );
  }
}
