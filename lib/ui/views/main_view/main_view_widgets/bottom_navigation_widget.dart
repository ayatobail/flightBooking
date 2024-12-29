import 'package:flight_booking_app/core/services/base_controller.dart';
import 'package:flight_booking_app/ui/shared/views_components/utils.dart';
import 'package:flight_booking_app/ui/views/main_view/home_view/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../../../core/enums/bottom_Navigation.dart';
import '../../../../core/themes/app_colors.dart';
import '../my_services_view/my_services_controller.dart';
import '../my_tripes_view/my_trips_controller.dart';
import 'bottom_navigation_controller.dart';

class BottomNavigationWidget extends StatefulWidget {
  final BottomNavigationEnum bottomNavigation;
  final Function(BottomNavigationEnum, int,) onTap;

  const BottomNavigationWidget(
      {super.key, required this.bottomNavigation, required this.onTap,});

  @override
  State<BottomNavigationWidget> createState() => _BottomNavigationWidgetState();
}

class _BottomNavigationWidgetState extends State<BottomNavigationWidget> {
  late BottomNavigationController controller;

  @override
  void initState() {
    controller = BottomNavigationController(widget.bottomNavigation);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        width: screenWidth(1),
        height: screenWidth(9),
        color: AppColors.primaryColor,
        child: Obx(() {
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              navItem(
                  onTap: () {
                    widget.onTap(BottomNavigationEnum.HOME, 0,);
                    controller.enumType.value = BottomNavigationEnum.HOME;
                  },
                  icon: Icons.home_outlined,
                  isSelected: controller.enumType.value ==
                      BottomNavigationEnum.HOME),
              navItem(
                  onTap: () {
                    widget.onTap(BottomNavigationEnum.MYTRIPS, 1,);
                    controller.enumType.value =
                        BottomNavigationEnum.MYTRIPS;

                  },
                  icon: Icons.airplanemode_active_outlined,
                  isSelected: controller.enumType.value ==
                      BottomNavigationEnum.MYTRIPS),
              navItem(
                  onTap: () {
                    widget.onTap(BottomNavigationEnum.MYSERVICES, 2,);
                    controller.enumType.value = BottomNavigationEnum.MYSERVICES;
                  },
                  icon: Icons.my_library_books_outlined,
                  isSelected:
                      controller.enumType.value == BottomNavigationEnum.MYSERVICES),
              navItem(
                  onTap: () {
                    widget.onTap(BottomNavigationEnum.SETTINGS, 3,);
                    controller.enumType.value =
                        BottomNavigationEnum.SETTINGS;
                  },
                  icon: Icons.settings_outlined,
                  isSelected: controller.enumType.value ==
                      BottomNavigationEnum.SETTINGS),
            ],
          );
        }));
  }

  Widget navItem({
    required IconData icon,
    required bool isSelected,
    required Function onTap,
  }) {
    return InkWell(
      onTap: () {
        onTap() ;
      },
      child: Padding(
        padding: EdgeInsetsDirectional.only(top: screenWidth(30)),
        child: Column(
          children: [
            Icon(
              icon,
              color: Colors.white,

            ),
            SizedBox(
              height: screenWidth(100),
            ),
            Container(
              width: screenWidth(10),
              height: screenWidth(200),
              color:
                  isSelected ? Colors.white : Colors.transparent,
            ),
          ],
        ),
      ),
    );
  }
}
