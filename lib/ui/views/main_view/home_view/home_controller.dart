import 'dart:ffi';

import 'package:flight_booking_app/core/data/models/apis/search_trips_codel.dart';
import 'package:flight_booking_app/ui/views/flight_views/flight_list_view/flight_list_controller.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import '../../../../core/data/reposotories/trips_repository.dart';
import '../../../../core/enums/message_type.dart';
import '../../../../core/services/base_controller.dart';
import '../../../shared/custom_widgets/custom_toast.dart';
import '../../flight_views/flight_list_view/flight_list.dart';
import 'package:intl/intl.dart';
import 'package:get/get_instance/get_instance.dart';

class HomeController extends BaseController {
  TextEditingController fromController = TextEditingController();
  TextEditingController toController = TextEditingController();
  RxString adultsController = "".obs;
  RxString kidsController = "".obs;
  RxString infantsController = "".obs;
  RxString departTime =
      DateFormat('yyyy-MM-dd').format(DateTime.now().toUtc()).obs;
  RxString returntTime = "".obs;
  String classType = "";
  RxBool loader = false.obs;
  RxBool isToSelected = false.obs;
  RxList<String> suggestins =
      <String>["erbil", "erland", "dubai", "damascus", "doha"].obs;
  RxList<String> filteredSuggestions = <String>[].obs;
  final GlobalKey<FormState> formKey1 = GlobalKey<FormState>();

  RxList<SearchModel> tripsList = <SearchModel>[].obs;
  late FlightListController controller;

  void searchOneWayTrip() {
    if (formKey1.currentState!.validate()) {
      loader.value = true;
      runFutureFunctionWithLoading(
          function: TripsRepository()
              .onwaySearch(
                  from: fromController.text,
                  to: toController.text,
                  date: departTime.value,
                  adultsNum: adultsController.value,
                  children: kidsController.value,
                  infants: infantsController.value,
                  classType: classType)
              .then((value) {
        value.fold((l) {
          loader.value = false;
          CustomToast.showMessage(
              message: l, messageType: MessageType.REJECTED);
        }, (r) {
          loader.value = false;
          tripsList.addAll(r);
          Get.to(FlightList(
            places: tripsList,
            from: fromController.text,
            to: toController.text,
          ));
        });
      }));
    }
  }

  void roundTrip() {
    if (formKey1.currentState!.validate()) {
      loader.value = true;
      runFutureFunctionWithLoading(
          function: TripsRepository()
              .onwaySearch(
        from: fromController.text,
        to: toController.text,
        date: departTime.value,
        returndate: returntTime.value,
        adultsNum: adultsController.value,
        children: kidsController.value,
        infants: infantsController.value,
        classType: classType,
      )
              .then((value) {
        value.fold((l) {
          loader.value = false;
          CustomToast.showMessage(
              message: l, messageType: MessageType.REJECTED);
        }, (r) {
          loader.value = false;
          tripsList.addAll(r);
          Get.to(FlightList(
            places: tripsList,
            from: fromController.text,
            to: toController.text,
            isRound: true,
          ));
        });
      }));
    }
  }

  void bookFlight(
      String? from,
      String? to,
      String? name,
      String cost,
      String depart,
      String returnDate,
      String image,
      String type,
      String depature_time,
      String arrival_time,
      String depature_airport,
      String arrival_airport,
      List<String> images) {
    runFutureFunctionWithFullLoading(
        function: TripsRepository.bookFlight(
                name: name!,
                from: from!,
                to: to!,
                depaturedate: depart,
                returndate: returnDate,
                cost: cost,
                id: "1",
                image: image,
                type: type,
                depature_time: depature_time,
                arrival_time: arrival_time,
                depature_airport: depature_airport,
                arrival_airport: arrival_airport,
                images: images)
            .then((value) {
      value.fold((l) {
        loader.value = false;
        CustomToast.showMessage(message: l, messageType: MessageType.REJECTED);
      }, (r) {
        CustomToast.showMessage(message: r, messageType: MessageType.SUCCESS);
      });
    }));
  }

  void filterSuggestions(String input) {
    filteredSuggestions.value =
        suggestins.where((suggestion) => suggestion.contains(input)).toList();
  }


}
