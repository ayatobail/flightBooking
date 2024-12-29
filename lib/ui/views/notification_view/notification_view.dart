import 'package:flight_booking_app/core/themes/app_colors.dart';
import 'package:flight_booking_app/ui/views/notification_view/notification_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import '../../shared/custom_widgets/custom_notification_card.dart';
import '../../shared/custom_widgets/custom_text.dart';
import '../../shared/views_components/utils.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/get_instance/get_instance.dart';

class NotificationView extends StatefulWidget {
  const NotificationView({Key? key}) : super(key: key);

  @override
  _NotificationViewState createState() => _NotificationViewState();
}

class _NotificationViewState extends State<NotificationView> {
  NotificationController controller = Get.put(NotificationController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(title: Text('Notifications')),
        body: Obx(
          () => Column(
            children: [
              controller.isLoading
                  ? Center(
                      child: Padding(
                      padding:
                          EdgeInsets.symmetric(vertical: screenHeight(2.5)),
                      child: CircularProgressIndicator(
                        color: AppColors.primaryColor,
                      ),
                    ))
                  : controller.notifications.isEmpty
                      ? Center(
                        child: Padding(
                          padding:  EdgeInsets.symmetric(vertical: screenHeight(2.5)),
                          child: CustomText(
                              textType: TextStyleType.CUSTOM,
                              textColor: AppColors.grey,
                              fontSize: screenWidth(20),
                              textAlign: TextAlign.center,
                              text: "No notifications yet",
                            ),
                        ),
                      )
                      : Expanded(
                          child: ListView.builder(
                            padding: EdgeInsets.zero,
                            scrollDirection: Axis.vertical,
                            shrinkWrap: true,
                            itemCount: controller.notifications.length,
                            itemBuilder: (BuildContext context, int index) {
                              return InkWell(
                                onTap: () {
                                  AwesomeDialog(
                                    context: context,
                                    dialogType: DialogType.info,
                                    animType: AnimType.rightSlide,
                                    customHeader: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Icon(
                                        Icons.notifications_active,

                                        size: screenWidth(7),
                                        color: AppColors.secondaryColor,
                                      ),
                                    ),
                                    headerAnimationLoop: false,
                                    title:
                                        controller.notifications[index].title,
                                    desc: controller.notifications[index].body,
                                    btnOkOnPress: () {
                                      controller.readNotification(
                                          controller.notifications[index].id!);
                                    },
                                    btnOkColor:
                                        Theme.of(context).primaryColorLight,
                                  )..show();
                                },
                                child: Padding(
                                  padding:
                                      const EdgeInsets.symmetric(horizontal: 1),
                                  child: Obx(
                                    () => Card(
                                        elevation: 0,
                                        color: controller
                                                .notifications[index].seen!
                                            ? Colors.white
                                            : AppColors.notificationColor,
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(12),
                                        ),
                                        // decoration: BoxDecoration(color:AppColors.backgroundColor,border: Border(bottom: BorderSide(color: AppColors.grey))),
                                        child: CustomNotificationCard(
                                          notification:
                                              controller.notifications[index],
                                        )),
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
            ],
          ),
        ),
      ),
    );
  }
}
