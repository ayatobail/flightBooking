import 'package:flight_booking_app/ui/shared/views_components/utils.dart';
import 'package:flight_booking_app/ui/views/sign_up_view/sign_up_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../shared/app_colors.dart';
import '../../shared/custom_widgets/agree_to_terms.dart';
import '../../shared/custom_widgets/app_loading_dialog.dart';
import '../../shared/custom_widgets/app_logo_container.dart';
import '../../shared/custom_widgets/app_text_field.dart';
import '../../shared/custom_widgets/custom_button.dart';
import '../../shared/custom_widgets/label_text.dart';

import 'login_controller.dart';

class LogInScreen extends StatefulWidget {
  const LogInScreen({super.key});

  @override
  State<LogInScreen> createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> {
  LoginController controller = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Form(
        key: controller.formKey1,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
                // height: MediaQuery.of(context).size.height * 0.08,
                ),
            AppLogoContainer(),
            LabelText(
              labelText: 'Enter your phone number',
              padding: 30,
            ),
            AppTextField(
              controller: controller.loginPhoneController,
              inputType: TextInputType.phone,
              validator: (value) {
                // value = context.read<AuthCubit>().phoneController.text;
                print(value);
                if (value == '' || value == null) {
                  return 'please enter your phone number';
                }
                if (value.length > 10) {
                  return 'enter a valid number';
                }
                return null;
              },
              hintText: '+964*********',
            ),
            LabelText(
              labelText: 'Enter your password',
              padding: 30,
            ),
            AppTextField(
              isPassword: true,
              controller: controller.loginPasswordController,
              validator: (value) {
                // value = context.read<AuthCubit>().phoneController.text;
                print(value);
                if (value == '' && value == null) {
                  return ' please enter your password';
                }
                return null;
              },
              hintText: '**********',
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.05,
            ),
            Obx(() {
              return controller.loader.value
                  ? LoadingDialog()
                  : AppButton(
                      onTap: () =>controller.login(),
                      btnWidth: screenWidth(1.17),
                      //btnWidth: context.width * 0.85,
                      buttonText: 'Log In');
            }),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.02,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 30, vertical: 8.0),
              child: Wrap(
                crossAxisAlignment: WrapCrossAlignment.center,
                alignment: WrapAlignment.start,
                children: [
                  FittedBox(
                    child: Text(
                      'Don\'t have an account yet !',
                      style: TextStyle(
                        // color: appColors.kDarkColor,
                        // fontFamily: appColor.kMedium,
                        fontSize: 16,
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: ()=>Get.to(SignUpView()),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'Sign Up',
                        style: TextStyle(
                          color: AppColors.primaryColor,
                          // fontFamily: appColor.kMedium,
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.05,
            ),
            AgreeToTermsText()
          ],
        ),
      ),
    ));
  }
}
