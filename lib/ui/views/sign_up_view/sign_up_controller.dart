import 'package:flight_booking_app/ui/views/login_view/login_view.dart';
import 'package:flight_booking_app/ui/views/main_view/layout_view/layout_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';

import '../../../core/data/reposotories/auth_repositories.dart';
import '../../../core/enums/message_type.dart';
import '../../../core/services/base_controller.dart';
import '../../../core/utils/general_utils.dart';
import '../../shared/custom_widgets/app_error_dialog.dart';
import '../../shared/custom_widgets/custom_toast.dart';

class RegisterController extends BaseController {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  RxBool isloading = true.obs;


  void register() {
    if (formKey.currentState!.validate()) {
      runFutureFunctionWithFullLoading(
          function: AuthRepositories.register(name: nameController.text,
            email: emailController.text,
            phone: phoneController.text,
            password: passwordController.text,


          ).then((value) {
            value.fold((l) {
              CustomToast.showMessage(
                  messageType: MessageType.REJECTED, message: l);;
            }, (r) {
              storage.setTokenInfo(r);
              storage.setId(r.id!);
              Get.offAll(layoutView());
              formKey.currentState!.save();
            });
          }));
    }
  }
}