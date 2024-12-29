import 'package:flight_booking_app/core/data/reposotories/services_repository.dart';
import 'package:flight_booking_app/core/services/base_controller.dart';
import 'package:flight_booking_app/core/utils/general_utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../core/data/models/apis/services_models/my_services_model.dart';
import '../../../../core/enums/message_type.dart';
import '../../../../core/themes/app_colors.dart';
import '../../../shared/custom_widgets/custom_toast.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';

class MyServicesController extends BaseController {
  RxList<MyServicesModel> myServicesList = <MyServicesModel>[].obs;
  RxList<MyServicesModel> filteredList = <MyServicesModel>[].obs;
  RxBool hasFilteredResult=RxBool(false);
  List<MyServicesModel> list = <MyServicesModel>[];
  TextEditingController searchController = TextEditingController();


  @override
  void onInit() {
    hasFilteredResult.value=false;
    filteredList.clear();
    searchController.clear();
    getAllMyServices();
    super.onInit();
  }

  void getAllMyServices() {
    runFutureFunctionWithLoading(
        function: ServicesRepository().showMyServices(
            storage.getId().toString()).then((value) {
          value.fold((l) {
            CustomToast.showMessage(
                message: l, messageType: MessageType.REJECTED);
          }, (r) {
            myServicesList.clear();
            myServicesList.addAll(r);



          });
        }));
  }


  /*void filterdTrips() {
    filteredList.clear();
    list!.forEach((element) {
      if (searchController.text == element.userName) {
        filteredList.add(element);

      }
    });

    if (filteredList.isNotEmpty) {
     myServicesList.clear();
      myServicesList.addAll(filteredList);
    } else {
      myServicesList.clear();
      myServicesList.addAll(list);
      CustomToast.showMessage(
          message: "No items founded", messageType: MessageType.INFO);
    }
  }*/
  void filterServices({required String status,String? filterType}){
    filteredList.clear();
    filterType == null
        ?
    filteredList.value =
        myServicesList.where((item) => item.suriceType!.toLowerCase().contains(status!.toLowerCase())).toList()
        : filteredList.value =
       myServicesList.where((item) => item.requestStatus!.contains(status!)).toList();
    hasFilteredResult.value = filteredList.isNotEmpty;
    if (!hasFilteredResult.value) {
      CustomToast.showMessage(
          message: "No result founded", messageType: MessageType.INFO);
    }
  }

  void showImage(BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            backgroundColor: AppColors.backgroundColor,
            content: SingleChildScrollView(
              child: Column(
                children: [
                  ListTile(title: Text('filtered by booking status:'),),
                  ListBody(
                    children: [
                      ListTile(
                        leading: Icon(Icons.request_page),
                        title: Text('Requested'),
                        onTap: () {
                         filterServices(filterType: "status",status: "Requested");
                          Get.back();
                        },
                      ),
                      ListTile(
                        leading: Icon(Icons.pending),
                        title: Text("Bending"),
                        onTap: () {
                          filterServices(filterType: "status",status: "Bending");
                          Get.back();
                        },
                      ),
                      ListTile(
                        leading: Icon(Icons.paid),
                        title: Text("Done"),
                        onTap: () {
                          filterServices(filterType: "status",status: "Done");
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

}