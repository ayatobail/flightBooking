import 'package:flight_booking_app/core/utils/app_sizes.dart';
import 'package:flutter/material.dart';

import '../app_colors.dart';

class CustomBar extends StatelessWidget {
  const CustomBar({super.key, required this.title});

  final String? title;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(
          'assets/images/globe.jpg',
          fit: BoxFit.cover,
        ),
        Positioned(
            top: context.height * 0.08,
            right: 20,
            left: 20,
            bottom: 0,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                title!,
                softWrap: true,
                maxLines: 2,
                style: TextStyle(
                    color: AppColors.primaryColor,
                    fontSize: 30,
                    fontStyle: FontStyle.italic,
                    fontWeight: FontWeight.w500),
              ),
            )),
      ],
    );
  }
}
