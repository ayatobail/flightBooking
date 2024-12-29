import 'package:flight_booking_app/core/services/base_controller.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';

import '../../../core/utils/general_utils.dart';

class ProfileController extends BaseController{
  RxString name = "".obs;
  RxString phone = "".obs;
  RxBool loader = false.obs;

  void onInit() {
    // TODO: implement onInit
    getInfo();
    super.onInit();
  }

  void getInfo() {
    name.value = storage.getProfileInfo()!.name!;
    phone.value = storage.getProfileInfo()!.mobilePhone!;
  }


}