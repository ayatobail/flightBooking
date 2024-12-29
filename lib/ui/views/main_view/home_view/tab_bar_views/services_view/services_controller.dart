import 'dart:io';
import 'package:flight_booking_app/core/data/models/apis/services_models/sub_sevice_info_model.dart';
import 'package:flight_booking_app/core/enums/operation_type.dart';
import 'package:flight_booking_app/core/utils/general_utils.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:flight_booking_app/core/data/reposotories/services_repository.dart';
import 'package:flutter/material.dart';
import '../../../../../../core/enums/message_type.dart';
import '../../../../../../core/enums/request_status.dart';
import '../../../../../../core/services/base_controller.dart';
import '../../../../../../core/themes/app_colors.dart';
import '../../../../../shared/custom_widgets/custom_toast.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:flutter/cupertino.dart';
import 'package:image_picker/image_picker.dart';

class ServicesController extends BaseController {
  RxList<dynamic> list = <dynamic>[].obs;
  RxList<dynamic> subList = <dynamic>[].obs;
  RxBool loader = false.obs;
  String service = "";
  int id = 0;
  int subServiceId = 0;
  SubServicesInfoModel info = SubServicesInfoModel(
      title: "", image: "", importantPapers: "",);
  TextEditingController numController = TextEditingController();
  TextEditingController namecontroller = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  RxBool visible = false.obs;
  String? image;
  RxBool isSelected = false.obs;
  RxBool isServiceSelected = false.obs;
  final GlobalKey<FormState> formKey1 = GlobalKey<FormState>();
  final ImagePicker picker = ImagePicker();
  final selectedImage = Rxn<File>();
  bool get isInfoLoading =>
      requestStatus.value == RequestStatus.LOADING &&
          operationTypeList.contains(OperationType.INFO);


  @override
  void onInit() {
    getServices();
    selectedImage.value = File("");
    super.onInit();
  }

  void getServices() {
    runFutureFunctionWithLoading(
        function: ServicesRepository().getAllServices().then((value) {
          value.fold((l) {
            CustomToast.showMessage(
                message: l, messageType: MessageType.REJECTED);
          }, (r) {
            list.addAll(r);
            /* r.forEach((element) {
        servicesList.add(element.type);
        });*/
            //tripsList.clear();
          });
        }));
  }

  void getSubServices() {
    runFutureFunctionWithLoading(
        function: ServicesRepository().getSubServices(id.toString()).then((
            value) {
          value.fold((l) {
            CustomToast.showMessage(
                message: l, messageType: MessageType.REJECTED);
          }, (r) {
            subList.clear();
            subList.addAll(r);
            //tripsList.clear();
          });
        }));
  }


  void subServiceInfo() {
    runFutureFunctionWithLoading(
        operationType: OperationType.INFO,
        function: ServicesRepository()
            .showSubServiceInfo(
            id: subServiceId.toString())
            .then((value) {
          value.fold((l) {
            CustomToast.showMessage(
                messageType: MessageType.REJECTED, message: l);
          }, (r) {
            info = r;
          });
        }));
  }

  void bookService() {
    if (formKey1.currentState!.validate()) {
      loader.value = true;
      runFutureFunctionWithLoading(
          function: ServicesRepository()
              .bookService(
              subServiceId.toString(), namecontroller.text, numController.text,
              descriptionController.text, image.toString())
              .then((value) {
            loader.value = false;
            value.fold((l) {
              CustomToast.showMessage(
                  message: l, messageType: MessageType.REJECTED);
            }, (r) {
              CustomToast.showMessage(
                  message: r, messageType: MessageType.SUCCESS);
              //tripsList.clear();
            });
          }));
    }
  }


  void showImage(BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            backgroundColor: AppColors.backgroundColor,
            content: SingleChildScrollView(
              child: ListBody(
                children: [
                  ListTile(
                    leading: Icon(Icons.camera_alt),
                    title: Text('Take photo'),
                    onTap: () {
                      handleImageSelection(ImageSource.camera);
                      Get.back();
                    },
                  ),
                  ListTile(
                    leading: Icon(Icons.photo_library),
                    title: Text('select from gallery'),
                    onTap: () {
                      handleImageSelection(ImageSource.gallery);
                      Get.back();
                    },
                  ),
                ],
              ),
            ),
          );
        });
  }


  void handleImageSelection(ImageSource source) async {
    final XFile? pickFile = await ImagePicker().pickImage(source: source);

    if (pickFile != null) {
      selectedImage.value = File(pickFile.path);
      image = pickFile!.path;
      visible.value = true;
    }
  }

  void onClose() {
    numController.clear();
  }

  String? serviceCost(){
   return storage.getTokenInfo()!.role=="marketer"? info.marketerCost.toString():info.userCost.toString();
  }


}
