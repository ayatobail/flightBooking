import 'package:flight_booking_app/core/utils/app_sizes.dart';

import 'package:flutter/material.dart';
import 'package:flutter_dash/flutter_dash.dart';
import '../app_colors.dart';

class TwoPointsConnect extends StatelessWidget {
  const TwoPointsConnect({super.key});

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18,vertical: 8.0),
      child: Row(
        children: [

                    Icon(
                      Icons.radio_button_checked_outlined,
                      color: AppColors.lightGreyColor,
                    ),
                    Dash(
                      dashThickness: 1,
                      dashGap: 2,
                      dashLength: 5,
                      length: context.width*0.32,
                      direction: Axis.horizontal,
                      dashColor:AppColors.lightGreyColor,
                    ),
          Icon(
            Icons.airplane_ticket_outlined,
            color: AppColors.lightGreyColor,
          ),
          Dash(
            dashThickness: 1,
            dashGap: 2,
            dashLength: 5,
            length: context.width*0.32,
            direction: Axis.horizontal,
            dashColor:AppColors.lightGreyColor,
          ),
          Icon(
            Icons.radio_button_off_outlined,
            color: AppColors.lightGreyColor,
          ),

        ],
      ),
    );
  }
}
