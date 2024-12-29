import 'package:flight_booking_app/core/data/models/apis/my_trips_model.dart';
import 'package:flight_booking_app/core/themes/app_colors.dart';
import 'package:flight_booking_app/ui/shared/views_components/utils.dart';
import 'package:flutter/material.dart';
import '../../custom_widgets/flight_location_info.dart';
import '../../custom_widgets/title_subtitle_column.dart';

class BookedTripsCard extends StatelessWidget {
  const BookedTripsCard({super.key, required this.myTrip});

  final MyTripsModel myTrip;

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      color: Colors.white,
      margin: EdgeInsets.all(12),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 20),
        child: Column(
          children: [
            FlightLocationInfo(
              from: myTrip.from,
              to: myTrip.destination,
              myTrip: myTrip,
            ),
            Divider(
              thickness: 1,
              indent: 20,
              endIndent: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TitleSubtitleColumn(
                    title: 'Travel agency',
                    subtitle: myTrip.name,
                    titleSize: screenWidth(20),
                    size: screenWidth(25)),
                TitleSubtitleColumn(
                    title: 'Flight date',
                    subtitle: myTrip.depatureDate,
                    titleSize: screenWidth(20),
                    size: screenWidth(25)),
                // TitleSubtitleColumn(title: 'Terminal', subtitle: '2E'),
              ],
            ),
            Divider(
              thickness: 1,
              indent: 20,
              endIndent: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              // crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TitleSubtitleColumn(
                    title: 'Depature time',
                    subtitle: myTrip.depatureTime,
                    titleSize: screenWidth(20),
                    size: screenWidth(25)),
                TitleSubtitleColumn(
                    title: 'Arrival time',
                    subtitle: myTrip.arrivalTime,
                    titleSize: screenWidth(20),
                    size: screenWidth(25)),
                //TitleSubtitleColumn(title: 'Group', subtitle: '3'),
              ],
            ),
            Divider(
              thickness: 1,
              indent: 20,
              endIndent: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TitleSubtitleColumn(
                  title: 'Depature airport',
                  subtitle: myTrip.depatureAirport,
                  titleSize: screenWidth(20),
                  size: screenWidth(25),
                ),

                //TitleSubtitleColumn(title: 'Gate', subtitle: '13'),
              ],
            ),
            TitleSubtitleColumn(
                title: 'Arrival airport',
                subtitle: myTrip.arrivalAirport,
                titleSize: screenWidth(20),
                size: screenWidth(25)),
            Divider(
              thickness: 1,
              indent: 20,
              endIndent: 20,
            ),
            Row(
              // mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TitleSubtitleColumn(
                    title: 'Trip type',
                    subtitle: myTrip.type == "true" ? "round" : "onway",
                    color: AppColors.primaryColor,
                    titleSize: screenWidth(20),
                    size: screenWidth(25)),
                TitleSubtitleColumn(
                    title: 'Status',
                    subtitle: myTrip.status,
                    color: AppColors.secondaryColor,
                    titleSize: screenWidth(20),
                    size: screenWidth(25)),
                TitleSubtitleColumn(
                    title: 'Name',
                    subtitle: 'Aya Tobail',
                    titleSize: screenWidth(20),
                    size: screenWidth(25)),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
