import 'package:flight_booking_app/ui/shared/app_colors.dart';
import 'package:flight_booking_app/ui/shared/custom_widgets/custom_button.dart';
import 'package:flight_booking_app/ui/shared/extensions/custom_sized_box_shared.dart';
import 'package:flight_booking_app/ui/shared/views_components/utils.dart';
import 'package:flight_booking_app/ui/views/main_view/home_view/tab_bar_views/services_view/services_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/get_instance/get_instance.dart';
import '../../../../../shared/custom_widgets/app_text_field.dart';
import '../../../../../shared/custom_widgets/custom_drop_down.dart';
import '../../../../../shared/custom_widgets/label_text.dart';
import '../../../../../shared/custom_widgets/title_subtitle_column.dart';
import 'package:url_launcher/url_launcher.dart';

class ServicesView extends StatefulWidget {
  const ServicesView({Key? key}) : super(key: key);

  @override
  State<ServicesView> createState() => _ServicesViewState();
}

ServicesController controller = Get.put(ServicesController());

class _ServicesViewState extends State<ServicesView> {
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Card(
        elevation: 4,
        color: Colors.white,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(18), topLeft: Radius.circular(18))),
        child: SizedBox(
          width: double.infinity,
          height: double.infinity,
          child: SingleChildScrollView(
            child: Form(
              key: controller.formKey1,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                // mainAxisSize: MainAxisSize.max,
                children: [
                  //screenHeight(100).ph,
                  Row(
                    //crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      LabelText(
                        labelText: 'Service type',
                        padding: 20,
                      ),
                      //screenWidth(16).pw,
                      AppDropDown(
                        //value: controller.list.value,
                        validator: (value) {
                          // value = context.read<AuthCubit>().phoneController.text;
                          print(value);
                          if (value == '' || value == null) {
                            return 'please select a service';
                          }
                        },

                        items: controller.list.value,
                        width: screenWidth(2),
                        rounded: 8.0,
                        color: AppColors.grey,
                        controller: controller,
                        key1: "service-id",
                        key2: "service-type",
                        onChanged: (val) {
                          controller.id = val;
                          controller.getSubServices();
                          controller!.isSelected.value = true;
                        },
                      ),
                    ],
                  ),

                  Visibility(
                    visible: controller.isSelected.value,
                    child: Row(
                      children: [
                        LabelText(
                          labelText: 'Service',
                          padding: 20,
                        ),
                        screenWidth(8.2).pw,
                        AppDropDown(
                          validator: (value) {
                            print(value);
                            if (value == '' || value == null) {
                              return 'please select a service';
                            }
                          },
                          items: controller.subList.value,
                          width: screenWidth(2),
                          rounded: 8.0,
                          color: AppColors.grey,
                          controller: controller,
                          key1: "id",
                          key2: "title",
                          onChanged: (val) {
                            // controller!.service=val.toString();
                            controller.subServiceId = val;
                            controller.subServiceInfo();
                            controller!.isServiceSelected.value = true;
                          },
                        )
                      ],
                    ),
                  ),
                  Visibility(
                    visible: controller.isServiceSelected.value,
                    child: controller.isInfoLoading
                        ? CircularProgressIndicator(
                      color: AppColors.primaryColor,
                    )
                        : Card(
                        shape: RoundedRectangleBorder(
                            side:
                            BorderSide(color: AppColors.lightGreyColor),
                            borderRadius: BorderRadius.circular(12)),
                        color: AppColors.backgroundColor,
                        margin: EdgeInsets.symmetric(
                            horizontal: screenWidth(8)),
                        child: Padding(
                          padding: EdgeInsets.all(screenWidth(15)),
                          child: Column(
                            children: [
                              Column(
                                children: [
                                  TitleSubtitleColumn(
                                    color: AppColors.primaryColor,
                                    title: 'Cost',
                                    subtitle:
                                    "${controller.serviceCost()} \$",
                                  ),
                                  TitleSubtitleColumn(
                                    color: AppColors.primaryColor,
                                    title: 'Required Pepers',
                                    htmlView:
                                    controller.info.importantPapers,
                                    //controller.info!.importantPapers ??"passprt, ID",
                                  ),
                                  InkWell(
                                    onTap: () {
                                      launch(controller.info.attachment!);

                                    },
                                    child: TitleSubtitleColumn(
                                      color: AppColors.primaryColor,
                                      title: 'Attachment',
                                      subtitle:"Click here",
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        )),
                  ),
                  serviceInfo(
                      name: 'Client Name',
                      controller: controller.namecontroller,
                      padding: 39,
                      validater: 'please enter your ID'),

                  serviceInfo(
                      name: 'Passport ID',
                      controller: controller.numController,
                      padding: 24,
                      validater: 'please enter your name'),

                  serviceInfo(
                      name: 'Description',
                      controller: controller.descriptionController,
                      padding: 23,
                      lines: 5,
                      height: 6),

                  Visibility(
                    visible: controller.visible.value,
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(8.0),
                        child: controller.selectedImage != null
                            ? Image.file(
                          controller.selectedImage!.value!,
                          fit: BoxFit.cover,
                          width: screenWidth(2),
                          height: screenHeight(4),
                        )
                            : Text("image not selected")),
                  ),

                  InkWell(
                    onTap: () => controller.showImage(context),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                            controller.visible.value
                                ? Icons.edit
                                : Icons.camera_alt,
                            color: AppColors.primaryColor),
                        Text(
                          controller.visible.value
                              ? 'Edit image'
                              : 'select image',
                          style: TextStyle(
                              color: AppColors.primaryColor, fontSize: 18),
                        ),
                      ],
                    ),
                  ),

                  screenHeight(30).ph,
                  controller.loader.value
                      ? CircularProgressIndicator(
                    color: AppColors.primaryColor,
                  )
                      : AppButton(
                      color: AppColors.secondaryColor,
                      onTap: () {
                        controller.bookService();
                      },
                      buttonText: 'Book service'),

                  SizedBox(
                    height: screenWidth(4),
                  )

                  // Align(
                  //     alignment: Alignment.bottomRight,
                  //     child: FloatingActionButton(onPressed: (){},child: Icon(Icons.search),))
                ],
              ),
            ),
          ),
        ),
      );
    });
  }
}

Widget serviceInfo({required String name,
  required TextEditingController controller,
  required double padding,
  String? validater,
  int? lines,
  double? height}) {
  return Row(
    children: [
      LabelText(
        labelText: name,
        padding: 20,
      ),
      screenWidth(padding).pw,
      AppTextField(
        controller: controller,
        width: screenWidth(2),
        height: screenHeight(height ?? 19),
        maxLines: lines ?? 1,
        validator: (value) {
          print(value);
          if (value == '' || value == null) {
            return validater;
          }
        },
      ),
    ],
  );
}
