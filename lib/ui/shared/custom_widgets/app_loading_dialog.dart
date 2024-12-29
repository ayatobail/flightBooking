import 'package:flight_booking_app/ui/shared/views_components/utils.dart';
import 'package:flutter/material.dart';

import 'package:flight_booking_app/core/utils/app_sizes.dart';
class LoadingDialog extends StatelessWidget {
  const LoadingDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: context.width*0.07,
        width: context.width*0.07,
            decoration: BoxDecoration(
              color:Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(16)),
            ),
            child: Center(
              child: CircularProgressIndicator(
                color: Theme.of(context).primaryColor,
                backgroundColor: Colors.white,

              ),
            ),
      ),
    );
  }
}
