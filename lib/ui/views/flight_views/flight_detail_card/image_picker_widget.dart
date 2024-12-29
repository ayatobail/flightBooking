import 'dart:developer';

import 'package:flight_booking_app/core/themes/app_colors.dart';
import 'package:flight_booking_app/ui/shared/custom_widgets/custom_text.dart';
import 'package:flight_booking_app/ui/shared/extensions/custom_sized_box_shared.dart';
import 'package:flight_booking_app/ui/shared/views_components/utils.dart';
import 'package:flight_booking_app/ui/views/main_view/home_view/home_controller.dart';
import 'package:flutter/material.dart';

import 'flight_detail_card_controller.dart';
import 'package:image_picker/image_picker.dart';
import 'package:get/get.dart';

class ImagePickerDialog extends StatefulWidget {
  final FlightDetailCardController controller;
  final String name;
  final String from;
  final String to;
  final String depart;
  final String returnDate;
  final String cost;
  final String image;
  final String type;
  final String depature_time;
  final String arrival_time;
  final String depature_airport;
  final String arrival_airport;

  const ImagePickerDialog({Key? key,
    required this.controller,
    required this.name,
    required this.from,
    required this.to,
    required this.depart,
    required this.returnDate,
    required this.cost,
    required this.image,
    required this.type,
    required this.depature_time,
    required this.arrival_time,
    required this.depature_airport,
    required this.arrival_airport})
      : super(key: key);

  @override
  State<ImagePickerDialog> createState() => _ImagePickerDialogState();
}

class _ImagePickerDialogState extends State<ImagePickerDialog> {
  HomeController bookController = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            CustomText(textType: TextStyleType.CUSTOM,fontSize: screenWidth(17), text: 'Please enter a copy of your passport',fontWeight: FontWeight.bold,),
            screenWidth(20).ph,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton.icon(
                  onPressed: () =>
                      widget.controller.pickImage(ImageSource.camera),
                  icon: Icon(Icons.camera_alt),
                  label: Text('Camera'),
                ),
                ElevatedButton.icon(
                  onPressed: () =>
                      widget.controller.pickImage(ImageSource.gallery),
                  icon: Icon(Icons.photo_library),
                  label: Text('Gallery'),
                ),
              ],
            ),
            Obx(
                  () => Column(
                    children: [
                      Text(widget.controller.selectedImageNames),
                      ElevatedButton(
                        onPressed: () {

                          if (widget.controller.selectedImages.isNotEmpty) {
                            log(widget.controller.selectedImagesPath.toString());
                            bookController.bookFlight(
                                widget.from,
                                widget.to,
                                widget.name,
                                widget.cost,
                                widget.depart,
                                widget.returnDate,
                                widget.image,
                                widget.type,
                                widget.depature_time,
                                widget.arrival_time,
                                widget.depature_airport,
                                widget.arrival_airport,
                                widget.controller.selectedImagesPath);
                          }

                          else {
                            Get.snackbar(
                              "No Images Selected",
                              "Please select at least one image to proceed.",
                              snackPosition: SnackPosition.BOTTOM,
                            );
                          }

                        },
                        child: Text('Submit Booking'),
                      ),
                    ],
                  ),

           )
          ],
        ),
      ),
    );
  }

  void dispose() {
    super.dispose();
    widget.controller.reset();
  }
}
