import 'package:flight_booking_app/core/translation/app_translation.dart';
import 'package:flight_booking_app/core/utils/app_sizes.dart';
import 'package:flight_booking_app/ui/shared/custom_widgets/custom_shimmer.dart';
import 'package:flight_booking_app/ui/shared/extensions/custom_sized_box_shared.dart';
import 'package:flight_booking_app/ui/shared/views_components/utils.dart';
import 'package:flight_booking_app/ui/views/main_view/my_tripes_view/my_trips_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import '../../../shared/app_colors.dart';
import '../../../shared/custom_widgets/app_text_field.dart';
import '../../../shared/custom_widgets/custom_text.dart';
import '../../../shared/views_components/tickets_components/booked_trip_card.dart';
import '../../../shared/views_components/tickets_components/wallet_info_card.dart';

class MyTripesView extends StatefulWidget {
  const MyTripesView({Key? key, required this.controller}) : super(key: key);
  final MyTripsController controller;

  @override
  _MyTripesViewState createState() => _MyTripesViewState();
}


class _MyTripesViewState extends State<MyTripesView> {

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
            title: Text('Booked tickets'),
            scrolledUnderElevation: 0,
            // backgroundColor: AppColors.primaryColor.withOpacity(0.3),
            elevation: 0),
        body: SizedBox(
          height: context.height,
          child: Column(
            //mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AppTextField(
                inputActionType: TextInputAction.search,
                hintText: "search",
                labelText: "search",
                size: screenWidth(25),
                controller: widget.controller.searchController,
                round: screenWidth(1),
                width: screenWidth(1),
                prefIcon: Icons.search,
                sufIcon:  Icons.filter_list_outlined,
                onTap: (){widget.controller.showImage(context);},
                onSubmitted: (value) {
                  widget.controller.filterTrips(status: widget.controller.searchController.text);
                },
              ),
              //WalletInfoCard(),
              Expanded(
                child: Obx(() {
                  return widget.controller.isLoading?Center(
                    child: CircularProgressIndicator(
                      color: AppColors.primaryColor,
                    ),
                  ):
                     widget.controller.myTripsList.isEmpty?CustomText(textType: TextStyleType.CUSTOM,textColor:AppColors.grey,fontSize: screenWidth(20),textAlign: TextAlign.center,text: "No booked flights yet",)
                  :ListView.builder(
                      padding: EdgeInsets.zero,
                      scrollDirection: Axis.vertical,
                      // physics:  NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount:  widget.controller.hasFilteredResult.value?widget.controller.filteredList.length:widget.controller.myTripsList.value.length,
                      itemBuilder: (context, index) {
                        return BookedTripsCard(myTrip:widget.controller.hasFilteredResult.value?widget.controller.filteredList[index]: widget.controller.myTripsList[index],);
                      });
                }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
