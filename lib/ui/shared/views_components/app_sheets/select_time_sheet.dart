import 'package:flight_booking_app/core/utils/app_sizes.dart';
import 'package:flight_booking_app/ui/views/main_view/home_view/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/get_core.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:intl/intl.dart';
import '../../custom_widgets/custom_button.dart';

class SelectTimeSheet extends StatefulWidget {
  const SelectTimeSheet({super.key, required this.controller, required this.isRound});

   final HomeController controller;
   final bool isRound;
  @override
  State<SelectTimeSheet> createState() => _SelectTimeSheetState();
}


class _SelectTimeSheetState extends State<SelectTimeSheet> {


  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          height: context.height*0.3,
          margin: EdgeInsets.symmetric(horizontal: 20,vertical: 20),
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: Colors.black12,
            borderRadius: BorderRadius.circular(12)
          ),
          child: CalendarDatePicker(
                initialDate: DateTime.now(),
                firstDate: DateTime.now(),
                lastDate: DateTime.utc(2030, 3, 14),
                onDateChanged: (date){setState(() {
                  widget.isRound?widget.controller.returntTime.value=DateFormat('yyyy-MM-dd').format(date).toString():
                  widget.controller.departTime!.value=DateFormat('yyyy-MM-dd').format(date).toString();

                });}),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 18.0),
          child: AppButton(onTap: (){Get.back();}, buttonText: 'Select Date',btnWidth: context.width*0.9,),
        )
      ],
    );
  }
}
