import 'package:flight_booking_app/core/utils/app_sizes.dart';
import 'package:flight_booking_app/ui/views/main_view/home_view/home_controller.dart';
import 'package:flutter/material.dart';
import '../app_colors.dart';
import '../views_components/app_sheets/select_time_sheet.dart';
import 'label_text.dart';

import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';


class DepartTimeComponent extends StatelessWidget {
  const DepartTimeComponent({super.key,this.isRound = false, required this.controller});
  final bool isRound;
  final HomeController controller;


  @override
  Widget build(BuildContext context) {
    return
      GestureDetector(
        onTap: ()async{
          await showModalBottomSheet(
              showDragHandle: true,
              isScrollControlled: true,
              context: context,
              backgroundColor: Colors.white,
              builder: (context) {
                return SelectTimeSheet(controller: controller,isRound:isRound ,);
              });

        },
        child: Container(
          width: context.width *0.35,
          margin: EdgeInsets.only(left: context.width * 0.03,),
          padding: EdgeInsets.symmetric(vertical: 4,horizontal: 8),
          decoration: BoxDecoration(
              // borderRadius: BorderRadius.circular(12),
              border: Border(bottom: BorderSide(color: AppColors.grey,)),
              // shape: BoxShape.rectangle
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Icon(Icons.edit_calendar_outlined,size: 25,),
              ),
              Obx((){
                return FittedBox(child:isRound == true ? LabelText(labelText: controller.returntTime.value==""?'return': controller.returntTime.value,padding: 8,) : Text(controller.departTime!.value,style: TextStyle(  fontSize: 16,
                  color: AppColors.textColor,
                ),));}
              )
            ],
          ),
        ),
      );
  }
}
