import 'package:flight_booking_app/ui/views/sign_up_view/sign_up_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

import '../../shared/custom_widgets/app_logo_container.dart';
import '../../shared/custom_widgets/app_text_field.dart';
import '../../shared/custom_widgets/custom_button.dart';
import '../../shared/custom_widgets/label_text.dart';
import '../../shared/views_components/utils.dart';

class SignUpView extends StatefulWidget {
  const SignUpView({Key? key}) : super(key: key);

  @override
  _SignUpViewState createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {
  RegisterController controller = Get.put(RegisterController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Form(
          key: controller.formKey,
          child: Column(
            children: [
              AppLogoContainer(),
              LabelText(
                labelText: 'Enter Your Name',
                padding: 30,
              ),
              AppTextField(
                hintText: 'username',
                controller: controller.nameController,
                validator: (value) {
                  // value = context.read<AuthCubit>().phoneController.text;
                  print(value);
                  if (value == '' || value == null) {
                    return 'please enter your name';
                  }
                  return null;
                },
              ),
              LabelText(
                labelText: 'Enter Your Email',
                padding: 30,
              ),
              AppTextField(
                hintText: 'example@gmail.com',
                controller: controller.emailController,
                validator: (value) {
                  // value = context.read<AuthCubit>().phoneController.text;
                  print(value);
                  if (value == '' || value == null) {
                    return 'please enter your email';
                  }
                  if (!value.contains('@') || !value.contains('.')) {
                    return 'please enter a valid email';
                  }
                  return null;
                },
              ),
              LabelText(
                labelText: 'Enter Your Phone Number',
                padding: 30,
              ),
              AppTextField(
                hintText: '+964*********',
                controller: controller.phoneController,
                validator: (value) {
                  // value = context.read<AuthCubit>().phoneController.text;
                  print(value);
                  if (value == '' || value == null) {
                    return 'please enter your phone number';
                  }
                  if (value.length > 10) {
                    return 'please enter a valid number';
                  }
                  return null;
                },
                inputType: TextInputType.phone,
              ),
              LabelText(
                labelText: 'Enter Your Password',
                padding: 30,
              ),
              AppTextField(
                isPassword: true,
                hintText: '*********',
                controller: controller.passwordController,
                validator: (value) {
                  // value = context.read<AuthCubit>().phoneController.text;
                  print(value);
                  if (value == '' || value == null) {
                    return 'please enter a password';
                  }
                  if (value.length < 7) {
                    return 'please enter a stronger password';
                  }
                  return null;
                },
              ),
              LabelText(
                labelText: 'Confirm Your Password',
                padding: 30,
              ),
              AppTextField(
                isPassword: true,
                hintText: '*********',
                controller: controller.confirmPasswordController,
                validator: (value) {
                  // value = context.read<AuthCubit>().phoneController.text;
                  print(value);
                  if (value == '' || value == null) {
                    return 'please confirm your password';
                  }
                  if (value != controller.passwordController.text) {
                    return 'your confirm password didn\'t match ';
                  }
                  return null;
                },
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.02,
              ),
             AppButton(
                  onTap: () => controller.register(),
                  buttonText: 'Sign Up',
                  btnWidth: screenWidth(1.17),
                ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.02,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
