import 'package:flight_booking_app/core/data/models/apis/services_models/my_services_model.dart';
import 'package:flight_booking_app/ui/views/main_view/my_services_view/my_services_view.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '../../../core/themes/app_colors.dart';
import '../../../core/utils/general_utils.dart';
import 'colored_text.dart';
import '../views_components/utils.dart';
class MyServicesWidget extends StatefulWidget {
  const MyServicesWidget({super.key, required this.service});
  final MyServicesModel service;

  @override
  State<MyServicesWidget> createState() => _MyServicesWidgetState();
}

class _MyServicesWidgetState extends State<MyServicesWidget> {
  @override
  Widget build(BuildContext context) {
    return  Card(
      shape: RoundedRectangleBorder(
          side: BorderSide(
              color:
              AppColors.lightGreyColor,
              style: BorderStyle.solid),
          borderRadius:
          BorderRadius.circular(12)),
      color: AppColors.backgroundColor,
      margin: EdgeInsets.all(8),
      child: Padding(
        padding: const EdgeInsets.symmetric(
            vertical: 8.0, horizontal: 8),
        child: Row(
          mainAxisAlignment:
          MainAxisAlignment
              .spaceBetween,
          children: [
            Column(
              crossAxisAlignment:
              CrossAxisAlignment.start,
              children: [
                serviceInfo(
                  name: 'Service type:',
                  value: widget.service
                      .suriceType ??
                      "",
                ),
                serviceInfo(
                  name: 'Sub-Service:',
                  value: widget
                      .service
                      .subserviceType ??
                      "",
                ),
                serviceInfo(
                    name: 'Status:',
                    value: widget
                        .service
                        .requestStatus ??
                        "",
                    color: Colors.green),
                ColoredText(
                  text: storage
                      .getTokenInfo()!
                      .role ==
                      "marketer"
                      ? '${widget.service.marketerCost} \$' ??
                      ""
                      : '${widget.service.userCost} \$' ??
                      "",
                  textColor:
                  AppColors.textColor,
                  size: screenWidth(23),
                ),
              ],
            ),
            Column(
              children: [
                ClipRRect(
                  borderRadius:
                  BorderRadius.circular(
                      screenWidth(1)),
                  child: CachedNetworkImage(
                    imageUrl: widget
                        .service
                        .image ??
                        "",
                    width: 100,
                    height: 100,
                    fit: BoxFit.fill,
                    placeholder: (context,
                        url) =>
                        CircularProgressIndicator(
                          color: AppColors
                              .primaryColor,
                        ),
                  ),
                ),
                ColoredText(
                  text: 'view details',
                  textColor: AppColors
                      .secondaryColor,
                  size: screenWidth(28),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

Widget serviceInfo(
    {required String name, required String value, Color? color}) {
  return Row(
    children: [
      ColoredText(
          size: screenWidth(23), text: name, textColor: AppColors.primaryColor),
      ColoredText(
          size: screenWidth(23),
          text: value,
          textColor: color ?? AppColors.textColor),
    ],
  );
}