import 'package:flight_booking_app/core/data/models/apis/search_trips_codel.dart';
import 'package:flight_booking_app/ui/shared/custom_widgets/custom_text.dart';
import 'package:flight_booking_app/ui/shared/custom_widgets/title_subtitle_column.dart';
import 'package:flight_booking_app/ui/shared/custom_widgets/two_points_connect.dart';
import 'package:flight_booking_app/ui/shared/views_components/utils.dart';
import 'package:flight_booking_app/ui/views/flight_views/flight_detail_card/flight_detail_card_controller.dart';
import 'package:flight_booking_app/ui/views/flight_views/flight_detail_card/image_picker_widget.dart';
import 'package:flight_booking_app/ui/views/main_view/home_view/home_controller.dart';
import 'package:flutter/material.dart';
import '../../../../core/themes/app_colors.dart';
import '../../../shared/custom_widgets/colored_text.dart';
import '../../../shared/custom_widgets/flight_location_info.dart';
import 'package:get/get.dart';

class FlightDetailCard extends StatelessWidget {
  FlightDetailCard({
    super.key,
    required this.places,
    required this.from,
    required this.to,
    this.isRound = false,
  });

  final SearchModel places;
  final String? from;
  final String? to;
  final bool? isRound;
  final HomeController controller = Get.put(HomeController());
  FlightDetailCardController bookController =
      Get.put(FlightDetailCardController());

  @override
  Widget build(BuildContext context) {
    List<String> arrivalTim = places.arrivalTime!.split("T");
    List<String> departTim = places.departureTime!.split("T");
    late List<String> returnArrivalTim;
    late List<String> returnDepartTim;
    if (isRound == true) {
      returnArrivalTim = places.returnFlights!.departureTime!.split("T");
      returnDepartTim = places.returnFlights!.arrivaltime!.split("T");
    }
    return Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        color: Colors.white,
        elevation: 2,
        margin: EdgeInsets.all(12),
        child: Column(
          children: [
            FlightLocationInfo(
              from: from,
              to: to,
              place: places,
            ),
            Column(
              children: [
                CustomText(
                  text: places.nameairline ?? "",
                  textColor: AppColors.textColor,
                  textType: TextStyleType.CUSTOM,
                ),
                //ColoredText(text: "Depart trip info", textColor:AppColors.primaryColor),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    TitleSubtitleColumn(
                      title: 'Depart',
                      subtitle: departTim[1],
                      size: screenWidth(20),
                    ),
                    //Text('23h 25m',style: TextStyle(color: AppColors.lightGreyColor,fontWeight: FontWeight.w200,fontSize: 14),),
                    TitleSubtitleColumn(
                      title: 'Arrival',
                      subtitle: arrivalTim[1],
                      size: screenWidth(20),
                    )
                  ],
                ),

                isRound == true
                    ? Column(
                        children: [
                          CustomText(
                            textType: TextStyleType.CUSTOM,
                            text: "Return trip info",
                            fontSize: screenWidth(20),
                            textColor: AppColors.primaryColor,
                          ),
                          // ColoredText(text: "Return trip info", textColor:AppColors.primaryColor),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              TitleSubtitleColumn(
                                title: 'Depart',
                                subtitle: returnDepartTim[1],
                                size: screenWidth(20),
                              ),
                              TitleSubtitleColumn(
                                title: 'Arrival',
                                subtitle: returnArrivalTim[1],
                                size: screenWidth(20),
                              ),
                            ],
                          ),
                          //TitleSubtitleColumn(title: 'Arrival', subtitle:returnArrivalTim[1] ,size: screenWidth(20),align: CrossAxisAlignment.center,),
                        ],
                      )
                    : Container()
              ],
            ),
            TwoPointsConnect(),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 20, vertical: 8.0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          ColoredText(
                              text:
                                  '${places.total!.toString()} ${places.currencyCode!.toString()}',
                              textColor: AppColors.secondaryColor),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 8.0),
                            child: Text(
                              'Ticket Price',
                              style: TextStyle(
                                  color: AppColors.lightGreyColor,
                                  fontWeight: FontWeight.w200,
                                  fontSize: 14),
                            ),
                          ),
                        ],
                      ),
                      InkWell(
                          onTap: () {
                            showDialog(
                                context: context,
                                builder: (context) => ImagePickerDialog(
                                      controller: bookController,
                                      name: places.nameairline!,
                                      from: from!,
                                      to: to!,
                                      depart: departTim[0],
                                      returnDate: arrivalTim[0],
                                      cost: places.total.toString(),
                                      image: places.logo!,
                                      type: isRound.toString()!,
                                      depature_time: departTim[1],
                                      arrival_time: arrivalTim[1],
                                      depature_airport: places.depaturairportename!,
                                      arrival_airport: places.arivalairportename!,
                                    ));
                            /*  controller!.bookFlight(
                                from,
                                to,
                                places.nameairline,
                                places.total.toString(),
                                departTim[0],
                                arrivalTim[0],
                                places.logo!,
                                isRound.toString()!,
                            departTim[1],
                            arrivalTim[1],
                            places.depaturairportename!,
                            places.arivalairportename!);*/
                          },
                          child: ColoredText(
                            text: 'Book Now',
                            textColor: AppColors.secondaryColor,
                            size: screenWidth(25),
                          )),
                    ],
                  ),
                  Row(
                    children: [
                      ColoredText(
                          text:
                              '${places.secondePrices!.toString()} ${places.currencyCode!.toString()}',
                          textColor: AppColors.secondaryColor),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Text(
                          'Price after discount',
                          style: TextStyle(
                              color: AppColors.lightGreyColor,
                              fontWeight: FontWeight.w200,
                              fontSize: 14),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ));
  }
}
