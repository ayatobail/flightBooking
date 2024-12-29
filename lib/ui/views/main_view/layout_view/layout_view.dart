import 'package:dot_navigation_bar/dot_navigation_bar.dart';
import 'package:flight_booking_app/core/enums/bottom_Navigation.dart';
import 'package:flight_booking_app/core/themes/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

import '../home_view/home_view.dart';
import '../main_view_widgets/bottom_navigation_widget.dart';
import '../my_services_view/my_services_view.dart';
import '../my_tripes_view/my_tripes_view.dart';
import '../settings_view/settings_view.dart';
import 'layout_controller.dart';

class layoutView extends StatefulWidget {
  const layoutView({Key? key}) : super(key: key);

  @override
  _layoutViewState createState() => _layoutViewState();
}

class _layoutViewState extends State<layoutView> {
  final layoutController controller = Get.put(layoutController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            resizeToAvoidBottomInset: true,
            extendBodyBehindAppBar: true,
            //extendBody: true,
            //backgroundColor: Theme.of(context).colorScheme.primary,
          //floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
          bottomNavigationBar: Obx(() {
            return BottomNavigationWidget(
              bottomNavigation: controller.selected.value,
              onTap: controller.onClick,
            );
          }),
          /*  bottomSheet: Obx(() =>
                DotNavigationBar(
                  //paddingR: EdgeInsets.all(0),
                  //marginR: EdgeInsets.all(0),
                  margin: EdgeInsets.only(top: 0
                  ),
                  backgroundColor: Theme
                      .of(context)
                      .primaryColor,
                  currentIndex: controller.currentIndex.value.index,
                  //curve: Curves.easeInOutCubic,
                  enableFloatingNavBar: false,
                  // duration: Duration(microseconds: 400),
                  onTap: (index) {
                    controller.navigateTo(BottomNavigationEnum.values[index],index);
                  },
                  items: [
                    DotNavigationBarItem(
                      icon: Icon(
                        Icons.home_outlined,
                        color: Colors.white,
                      ),
                    ),
                    DotNavigationBarItem(
                        icon: Icon(
                          Icons.airplanemode_active_outlined,
                          color: Colors.white,
                        )),
                    DotNavigationBarItem(
                        icon: Icon(
                          Icons.my_library_books_outlined,
                          color: Colors.white,
                        )),

                    DotNavigationBarItem(
                        icon: Icon(
                          Icons.settings_outlined,
                          color: Colors.white,
                        )),
                  ],
                  dotIndicatorColor: Colors.white,
                  //borderRadius: 8,

                )),*/

          body: PageView(
            physics: NeverScrollableScrollPhysics(),
            controller: controller.pageController,
            children: [
              HomeView(),
              MyTripesView(controller: controller.tripsController,),
              MysServices(controller: controller.serviceController,),
              SettingsView(),
            ],
          ),


    )
    ,
    );
  }
}