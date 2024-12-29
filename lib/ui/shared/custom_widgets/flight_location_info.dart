import 'package:flight_booking_app/core/data/models/apis/my_trips_model.dart';
import 'package:flight_booking_app/core/data/models/apis/search_trips_codel.dart';
import 'package:flight_booking_app/core/extensions/app_sizes.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '../app_colors.dart';
import 'colored_text.dart';


class FlightLocationInfo extends StatelessWidget {
  const FlightLocationInfo({super.key, required this.from, required this.to, this.place, this.myTrip});
  final String? from;
  final String? to;
  final SearchModel? place;
  final MyTripsModel? myTrip;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        ColoredText(text: place!=null?from!:myTrip!.from??"", textColor: AppColors.primaryColor,leftPadding: 0,),
        CachedNetworkImage(imageUrl:place!=null?place!.logo??"":myTrip!.logo??"",fit: BoxFit.cover,width: context.width*0.12),
       // Image.asset('assets/images/airlines_logo.png',fit: BoxFit.cover,width: context.width*0.12),
        ColoredText(text: place!=null?to!:myTrip!.destination??"", textColor: AppColors.primaryColor,leftPadding: 0,),
      ],
    );

  }
}
