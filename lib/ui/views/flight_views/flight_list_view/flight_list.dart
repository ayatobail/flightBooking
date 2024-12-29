import 'package:flight_booking_app/core/data/models/apis/search_trips_codel.dart';
import 'package:flight_booking_app/core/utils/app_sizes.dart';
import 'package:flight_booking_app/ui/shared/custom_widgets/custom_shimmer.dart';
import 'package:flight_booking_app/ui/shared/views_components/utils.dart';
import 'package:flight_booking_app/ui/views/flight_views/flight_detail_card/flight_detail_card.dart';
import 'package:flight_booking_app/ui/views/flight_views/flight_list_view/flight_list_controller.dart';
import 'package:flight_booking_app/ui/views/main_view/home_view/home_controller.dart';
import 'package:flutter/material.dart';

import '../../../shared/app_colors.dart';
import '../../../shared/custom_widgets/app_drop_down.dart';
import '../../../shared/custom_widgets/custom_bar.dart';
import '../../../shared/custom_widgets/filtering_row.dart';
import '../../../shared/custom_widgets/label_text.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/get_instance/get_instance.dart';

class FlightList extends StatefulWidget {
  const FlightList({
    Key? key,
    required this.places,
    required this.from,
    required this.to,
    this.isRound = false,
  }) : super(key: key);
  final List<SearchModel> places;
  final String? from;
  final String? to;
  final bool? isRound;

  @override
  _FlightListState createState() => _FlightListState();
}

late FlightListController controller;

class _FlightListState extends State<FlightList> {
  void initState() {
    controller = FlightListController(widget.places);
    super.initState();
  }

  void dispose() {
    widget.places.clear();
    controller.filteredFlights.clear();
    controller.hasFilteredResult.value=false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      // appBar: AppBar(
      //   title: LabelText(labelText: 'Flights',padding: 0,),
      // ),
      body: SingleChildScrollView(
        child: SizedBox(
          height: context.height * 1,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Expanded(
                child: Stack(
                  children: [
                    const CustomBar(
                      title: 'Available Flights',
                    ),
                    Positioned(
                        top: context.height * 0.15,
                        left: 0,
                        right: 0,
                        bottom: 0,
                        child: Card(
                            elevation: 4,
                            color: Colors.white,
                            shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(18),
                                    topLeft: Radius.circular(18))),
                            child: SizedBox(
                              width: double.infinity,
                              child: Column(
                                children: [
                                  Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: SizedBox(
                                        height: context.height * 0.09,
                                        child:  SingleChildScrollView(
                                          scrollDirection: Axis.horizontal,
                                          child: Row(
                                              children: [
                                                AppDropDown(
                                                  items: ['price', 'time'],
                                                  width: context.width * 0.3,
                                                  labelText: "sorted by",
                                                  color: AppColors.grey,
                                                  //hintText: 'sorted by',
                                                  padding: screenWidth(50),
                                                  onChanged: (val) {
                                                    if (val == "time") {
                                                      controller.sortByDate();
                                                    }
                                                    if (val == "price") {
                                                      controller.sortByPrice();
                                                    }
                                                  },
                                                ),
                                                AppDropDown(
                                                  items: ['no stops', 'one stop','1+ stops'],
                                                  width: context.width * 0.3,
                                                  labelText: "stops filtering",
                                                  color: AppColors.grey,
                                                  //hintText: 'sorted by',
                                                  padding: screenWidth(50),
                                                  onChanged: (val) {
                                                    if (val == "date") {
                                                      controller.sortByDate();
                                                    }
                                                    if (val == "price") {
                                                      controller.sortByPrice();
                                                    }
                                                  },
                                                ),
                                                AppDropDown(
                                                  labelText: 'airlines filtering',
                                                  color: AppColors.grey,
                                                  items: controller.airlines.toList(),
                                                  width: context.width * 0.5,
                                                  //hintText: 'sorted by',
                                                  padding: screenWidth(50),
                                                  onChanged: (val) {
                                                    controller.filterFlights(value: val);
                                                  },
                                                ),
                                              ],
                                            ),
                                        ),
                                      )),
                                  //FilteringRow(flights: widget.places,),
                                  Obx(()=>
                                    LabelText(
                                      labelText:
                                          '${controller.flights.length} flights available from ${widget.from} to ${widget.to}',
                                      size: 16,
                                    ),
                                  ),
                                  Obx(
                                    () => Expanded(
                                      child: ListView.builder(
                                          shrinkWrap: true,
                                          itemCount: controller.hasFilteredResult.value?controller.filteredFlights.length:controller.flights.length,
                                          itemBuilder: (context, index) {
                                            return FlightDetailCard(
                                              places: controller.hasFilteredResult.value?controller.filteredFlights[index]:controller.flights[index],
                                              from: widget.from,
                                              to: widget.to,
                                              isRound: widget.isRound,
                                            );
                                          }),
                                    ),
                                  ),
                                ],
                              ),
                            )))
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
