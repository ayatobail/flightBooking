import 'package:flight_booking_app/core/enums/booking_statuse.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get.dart';
import '../../../../core/data/models/apis/my_trips_model.dart';
import '../../../../core/data/reposotories/trips_repository.dart';
import '../../../../core/enums/message_type.dart';
import '../../../../core/services/base_controller.dart';
import '../../../../core/themes/app_colors.dart';
import '../../../shared/custom_widgets/custom_toast.dart';

class MyTripsController extends BaseController {
  RxList<MyTripsModel> myTripsList = <MyTripsModel>[].obs;
  RxList<MyTripsModel> filteredList = <MyTripsModel>[].obs;
  RxBool hasFilteredResult = RxBool(false);
  RxList<MyTripsModel> list = <MyTripsModel>[].obs;
  TextEditingController searchController = TextEditingController();


  @override
  void onInit() {
    searchController.text = "";
    hasFilteredResult.value = false;
    filteredList.clear();
    getAllTrips();
    super.onInit();
  }

  void getAllTrips() {
    runFutureFunctionWithLoading(
        function: TripsRepository().getAllTrips().then((value) {
          value.fold((l) {
            CustomToast.showMessage(
                message: l, messageType: MessageType.REJECTED);
          }, (r) {
            myTripsList.clear();
            myTripsList.addAll(r);
          });
        }));
  }

  void filterTrips({String? status, String? filterType}) {
    filteredList.clear();
    filterType == null
        ?
    filteredList.value =
        myTripsList.where((item) => item.name!.toLowerCase().contains(status!.toLowerCase())).toList()
        : filteredList.value =
        myTripsList.where((item) => item.status!.contains(status!)).toList();
    hasFilteredResult.value = filteredList.isNotEmpty;
    if (!hasFilteredResult.value) {
      CustomToast.showMessage(
          message: "No result founded", messageType: MessageType.INFO);
    }
  }

  /*void filterdTrips(){
    filteredTripsList.clear();
    list!.forEach((element) {
      if(searchController.text==element.flightN.toString())
      {filteredTripsList.add(element);}
    });

    if(filteredTripsList.isNotEmpty)
    {tripsList.value=filteredTripsList;}else{tripsList.value=list ; CustomToast.showMessage(
        message: "No items founded", messageType: MessageType.INFO);
    }
  }*/

  /* void filterdTripsByStatuse(String status){
    filteredTripsList.clear();
    list!.forEach((element) {
      if(status==element.status)
      {filteredTripsList.add(element);}
    });

    if(filteredTripsList.isNotEmpty)
    {tripsList.value=filteredTripsList;}
    else{tripsList.value=list ;CustomToast.showMessage(
        message: "No ${status} flights founded", messageType: MessageType.INFO);
    }
  }*/

  void showImage(BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            backgroundColor: AppColors.backgroundColor,
            content: SingleChildScrollView(
              child: Column(
                children: [
                  ListTile(title: Text('filtered by boking status:'),),
                  ListBody(
                    children: [
                      ListTile(
                        leading: Icon(Icons.request_page),
                        title: Text('Requested'),
                        onTap: () {
                          filterTrips(status: "Requested",filterType: "status");
                          Get.back();
                        },
                      ),
                      ListTile(
                        leading: Icon(Icons.pending),
                        title: Text("Bending"),
                        onTap: () {
                          filterTrips(status: "Bending",filterType: "status");
                          Get.back();
                        },
                      ),
                      ListTile(
                        leading: Icon(Icons.paid),
                        title: Text("Done"),
                        onTap: () {
                          filterTrips(status: "Done",filterType: "status");
                          Get.back();
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        });
  }

  void dispose() {
    super.dispose();
  }

}