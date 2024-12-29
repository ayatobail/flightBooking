import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';

import '../../../core/data/reposotories/auth_repositories.dart';
import '../../../core/data/reposotories/profile_repository.dart';
import '../../../core/enums/message_type.dart';
import '../../../core/services/base_controller.dart';
import '../../../core/utils/general_utils.dart';
import '../../shared/custom_widgets/app_error_dialog.dart';
import '../../shared/custom_widgets/custom_toast.dart';
import '../main_view/layout_view/layout_view.dart';
import 'login_view.dart';

 class  LoginController extends BaseController {
  RxBool loader = false.obs;
  TextEditingController loginPhoneController = TextEditingController();
  TextEditingController loginPasswordController = TextEditingController();
  final GlobalKey<FormState> formKey1 = GlobalKey<FormState>();

  void login() {
    if (formKey1.currentState!.validate()) {
      runFutureFunctionWithFullLoading(
          function: AuthRepositories()
              .login(
              phone: loginPhoneController.text, password: loginPasswordController.text)
              .then((value) {
            value.fold((l) {
              CustomToast.showMessage(
                  messageType: MessageType.REJECTED, message: l);
              //loader.value = true;
             // ErrorDialog(errorText: l);
            }, (r) {
              storage.setTokenInfo(r);
              storage.setId(r.id!);
              Get.off(layoutView());
              formKey1.currentState!.save();
            });
          }));
    }
  }


}