import 'package:flight_booking_app/core/services/base_controller.dart';
import 'package:flight_booking_app/ui/views/main_view/my_services_view/my_services_controller.dart';
import 'package:flight_booking_app/ui/views/main_view/my_tripes_view/my_trips_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import '../../../../core/enums/bottom_Navigation.dart';



class layoutController extends BaseController{
  MyServicesController serviceController=MyServicesController();
  MyTripsController tripsController=MyTripsController();
  Rx<BottomNavigationEnum> currentIndex = BottomNavigationEnum.HOME.obs;
  PageController pageController = PageController(initialPage: 0);
  late Rx<BottomNavigationEnum> selected = BottomNavigationEnum.HOME.obs;
  RxInt pageIndex = 1.obs;

  void onClick(BottomNavigationEnum select, int pageNumber,) {
    selected.value = select;
    if(selected == BottomNavigationEnum.MYSERVICES.obs){serviceController.onInit();}
    if(selected == BottomNavigationEnum.MYTRIPS.obs){tripsController.onInit();}
    pageController.jumpToPage(pageNumber);
    pageIndex.value = pageNumber;

  }

}