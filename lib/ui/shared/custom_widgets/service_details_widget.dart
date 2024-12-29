import 'package:flight_booking_app/ui/shared/extensions/custom_sized_box_shared.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '../../../core/themes/app_colors.dart';
import '../views_components/utils.dart';
import 'colored_text.dart';
import 'custom_text.dart';

Widget CustomServiceDetailsWidget(
    {required String title, String? text, String? photo, TextAlign? align}) {
  return Card(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(12),
      side:
          BorderSide(color: AppColors.lightGreyColor, style: BorderStyle.solid),
    ),
    color: AppColors.backgroundColor,
    margin: EdgeInsets.all(12),
    child: Row(
      //mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        ColoredText(
          text: title,
          textColor: AppColors.primaryColor,
          leftPadding: screenWidth(15),
          size: screenWidth(20),
        ),
        Spacer(),
        photo == null
            ? Container(
                width: screenWidth(2),
                child: Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: CustomText(
                    textType: TextStyleType.CUSTOM,
                    textAlign: align ?? TextAlign.end,
                    text: text ?? "",
                    textColor: AppColors.grey,
                    fontSize: screenWidth(20),
                  ),
                ))
            /* ColoredText(`
                  text: text??"",
                  textColor: AppColors.grey,
                  leftPadding: 0,
                  size: screenWidth(20))*/
            : Padding(
                padding: EdgeInsets.symmetric(vertical: screenWidth(20)),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(screenWidth(1)),
                  child: CachedNetworkImage(
                      imageUrl: photo,
                      width: 110,
                      height: 110,
                      fit: BoxFit.fill,
                      placeholder: (context, url) => CircularProgressIndicator(
                            color: AppColors.primaryColor,
                          )),
                ),
              ),
        screenWidth(15).pw
      ],
    ),
  );
}
