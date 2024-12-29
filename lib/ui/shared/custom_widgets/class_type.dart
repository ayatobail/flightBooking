
import 'package:flight_booking_app/ui/views/main_view/home_view/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

import '../app_colors.dart';

class ClassType extends StatefulWidget {
   ClassType({super.key,required this.icon,required this.classType, required this.controller});
  final IconData icon;
  final String classType;
  bool isSelected=false;
   final HomeController controller;

  @override
  State<ClassType> createState() => _ClassTypeState();
}


class _ClassTypeState extends State<ClassType> {
  @override
  Widget build(BuildContext context) {
      return InkWell(
        onTap:(){setState(() {
          widget.isSelected=true;
          widget.controller.classType=widget.classType;
        });


        },
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Icon(widget.icon,size: 25,color: widget.isSelected? AppColors.textColor:AppColors.grey,),
            ),
            FittedBox(child: Text(widget.classType,style: TextStyle(fontSize: 18,fontWeight: FontWeight.w500,color:widget.isSelected?AppColors.textColor : AppColors.grey),)),

          ],
        ),
      );
  }
}
