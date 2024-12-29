import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../app_colors.dart';

class TabBarComponent extends StatelessWidget {
  const TabBarComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return TabBar(
      tabs: [
        Tab(
            child: Text(
          'Round Trip',
        )),
        Tab(
          child: Text(
            'One Way',
          ),
        ),

        Tab(
          child: Text(
            'Services',
          ),
        ),
      ],
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 8),
      indicatorColor: AppColors.primaryColor,
      indicatorSize: TabBarIndicatorSize.label,
      //indicatorPadding: EdgeInsets.only(right: 20),
      //tabAlignment: TabAlignment.start,
      isScrollable: false,
      automaticIndicatorColorAdjustment: true,
      //dividerHeight: 0,
      indicatorWeight: 1,
      splashBorderRadius: BorderRadius.circular(20),
      labelColor: AppColors.primaryColor,
      unselectedLabelColor: Colors.black87,
      labelStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
    );
  }
}
