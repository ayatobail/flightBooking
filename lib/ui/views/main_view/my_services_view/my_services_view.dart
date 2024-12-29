import 'dart:ffi';

import 'package:flight_booking_app/core/extensions/app_sizes.dart';
import 'package:flight_booking_app/core/themes/app_colors.dart';
import 'package:flight_booking_app/ui/shared/views_components/utils.dart';
import 'package:flight_booking_app/ui/views/main_view/my_services_view/my_services_controller.dart';
import 'package:flight_booking_app/ui/shared/custom_widgets/my_services_widget.dart';
import 'package:flight_booking_app/ui/views/service_details_view/service_details_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import '../../../../core/utils/general_utils.dart';
import '../../../shared/custom_widgets/app_text_field.dart';
import '../../../shared/custom_widgets/colored_text.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/get_core/get_core.dart';
import '../../../shared/custom_widgets/custom_text.dart';
import 'package:cached_network_image/cached_network_image.dart';

class MysServices extends StatefulWidget {
  const MysServices({Key? key, required this.controller}) : super(key: key);
  final MyServicesController controller;

  @override
  _MysServicesState createState() => _MysServicesState();
}

class _MysServicesState extends State<MysServices> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Booked services'),
          scrolledUnderElevation: 0,
        ),
        body:  SizedBox(
              height: context.height,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 0),
                child: Column(
                  // mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    AppTextField(
                      inputActionType: TextInputAction.search,
                      hintText: "search",
                      labelText: "search",
                      size: screenWidth(25),
                      controller: widget.controller.searchController,
                      round: screenWidth(1),
                      width: screenWidth(1),
                      sufIcon: Icons.filter_list_outlined,
                      onTap: () {
                        widget.controller.showImage(context);
                      },
                      prefIcon: Icons.search,
                      onSubmitted: (value) {
                        widget.controller.filterServices(status: widget.controller.searchController.text);
                      },
                    ),
                    Expanded(
                      child: Obx(()
                       => widget.controller.isLoading
                            ? Center(
                                child: CircularProgressIndicator(
                                color: AppColors.primaryColor,
                              ))
                            : widget.controller.myServicesList.isEmpty
                                ? CustomText(
                                    textType: TextStyleType.CUSTOM,
                                    textColor: AppColors.grey,
                                    fontSize: screenWidth(20),
                                    textAlign: TextAlign.center,
                                    text: "No booked servicec yet",
                                  )
                                : ListView.builder(
                                    shrinkWrap: true,
                                    itemCount: widget
                                            .controller.hasFilteredResult.value
                                        ? widget.controller.filteredList.length
                                        : widget
                                            .controller.myServicesList.length,
                                    itemBuilder: (context, index) {
                                      return InkWell(
                                        onTap: () => Get.to(ServiceDetailsView(
                                          myService: widget.controller.hasFilteredResult.value?widget.controller.filteredList[index]:widget
                                              .controller.myServicesList[index],
                                        )),
                                        child:
                                          MyServicesWidget(service:widget.controller.hasFilteredResult.value? widget.controller.filteredList[index]:widget.controller.myServicesList[index])
                                      );
                                    }),
                      ),
                    )
                  ],
                ),
              ))
        );
  }
}

