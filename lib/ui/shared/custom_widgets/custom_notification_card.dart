import 'package:flight_booking_app/core/data/models/notification_model.dart';
import 'package:flight_booking_app/core/themes/app_colors.dart';
import 'package:flight_booking_app/ui/shared/extensions/custom_sized_box_shared.dart';
import 'package:flutter/material.dart';

import '../views_components/utils.dart';
import 'custom_text.dart';

class CustomNotificationCard extends StatelessWidget {
  const CustomNotificationCard({super.key, required this.notification});
  final NotificationModel notification;

  @override
  Widget build(BuildContext context) {
    List<String> date=notification.time!.split("T");
    List<String> time=date[1]!.split(".");
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 4,
      ),
      child: Padding(
        padding: EdgeInsets.only(top: screenWidth(25)),
        child: Container(
          child: Column(
            children: [
              Row(
                children: [
                  Column(
                    children: [
                      Icon(
                        Icons.notifications_active,
                        size: screenWidth(7),
                        color: AppColors.primaryColor,
                      ),
                      /*CustomText(
                      textType: TextStyleType.BODYBIG,
                      text: "not read",
                      textColor: AppColors.secondaryColor,
                    )*/
                    ],
                  ),
                  screenWidth(25).pw,
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          CustomText(
                            textType: TextStyleType.CUSTOM,
                            text: date[0],
                            fontWeight: FontWeight.bold,
                            fontSize: screenWidth(25),
                          ),
                          screenWidth(7).pw,
                          CustomText(
                              textType: TextStyleType.CUSTOM,
                              text: time[0],
                              fontWeight: FontWeight.bold,
                              fontSize: screenWidth(25)),
                          screenWidth(10).pw,

                          IconButton(
                              onPressed: () {
                                final snackBar = SnackBar(
                                  padding: EdgeInsets.symmetric(vertical: 5,horizontal: 6,),
                                  backgroundColor: AppColors.textColor,
                                  content: CustomText(
                                    textType: TextStyleType.CUSTOM,
                                    text: "Remove this notification",
                                    fontSize: screenWidth(25),
                                    textColor: Colors.red,
                                    textAlign: TextAlign.start,
                                  ),
                                  action: SnackBarAction(
                                    label: "dissmiss",
                                    textColor: Colors.white,
                                    onPressed: () {},
                                  ),
                                );
                                ScaffoldMessenger.of(context)
                                    .showSnackBar(snackBar);
                              },
                              icon: Icon(
                                Icons.more_vert,
                                color: AppColors.grey,
                                size: screenWidth(15),
                              ))
                        ],
                      ),
                      //screenWidth(18).ph,
                      Container(
                          width: screenWidth(1.8),
                          child: CustomText(
                              textType: TextStyleType.CUSTOM,
                              fontSize: screenWidth(25),
                              textAlign: TextAlign.start,
                              text:
                                 notification.title??""))
                    ],
                  )
                ],
              ),
              screenHeight(35).ph,
            ],
          ),
        ),
      ),
    );
  }
}
