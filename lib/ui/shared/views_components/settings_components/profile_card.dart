
import 'package:flight_booking_app/core/utils/general_utils.dart';
import 'package:flutter/material.dart';

import '../../app_colors.dart';

class ProfileCard extends StatelessWidget {
  const ProfileCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(12),
      padding: EdgeInsets.all(4),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.symmetric(horizontal: 12,vertical: 0),
            padding: EdgeInsets.all(4),
            height: MediaQuery.of(context).size.height * 0.1,
            width: MediaQuery.of(context).size.height * 0.1,
            decoration: BoxDecoration(
              // border: Border.all(
              //     color: AppColors.secondaryColor, width: 1),

            shape: BoxShape.circle
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(100),
              child: Image.asset('assets/images/profile.png',
                  fit: BoxFit.cover)
            ),
          ),

          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 10,
              ),
              Text(
                storage.getTokenInfo()!.name??"",
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                    color: AppColors.textColor),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                storage.getTokenInfo()!.email??"",
                style: TextStyle(
                  color: AppColors.grey,
                  fontSize: 18,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),

        ],
      ),

    );
  }
}
