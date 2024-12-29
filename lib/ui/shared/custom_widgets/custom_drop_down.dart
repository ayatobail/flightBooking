import 'package:flight_booking_app/core/utils/app_sizes.dart';
import 'package:flight_booking_app/ui/shared/views_components/utils.dart';
import 'package:flutter/material.dart';
import '../../views/main_view/home_view/tab_bar_views/services_view/services_controller.dart';
import '../app_colors.dart';


class AppDropDown extends StatefulWidget {
  AppDropDown(
  {super.key,
  // this.categoryAttributeSchemaModel,
  required this.items,
  this.hintText,
  this.labelText,
  this.isConst = true,
  this.value,
  this.onChanged,
  this.width,
  this.rounded,
  this.color,
  this.controller,
  this.validator,
  this.id,
  this.key1,
  this.key2

  });

  // final CategoryAttributeSchemaModel? categoryAttributeSchemaModel;
  final List items;
  String? hintText;
  String? labelText;
  final bool isConst;
  double? width;
  double? rounded;
  Color? color;
  String? Function(dynamic)? validator;
  final ServicesController? controller;
  // ignore: prefer_typing_uninitialized_variables
  dynamic? value;
  int? id;
  final Function(dynamic val)? onChanged;
  String? key1;
  String? key2;

  @override
  State<AppDropDown> createState() => _AppDropDownState();
}

class _AppDropDownState extends State<AppDropDown> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 16.0,horizontal: screenWidth(16.5)),
      child: Container(
        // color: Colors.white,
          width:widget.width ?? context.width * 0.85,
          //height: screenHeight(10),
          child: DropdownButtonFormField<dynamic>(
            validator: widget.validator ,
            value: widget.id,
            isExpanded: false,
            dropdownColor: AppColors.backgroundColor,
            borderRadius: BorderRadius.circular(12),
            focusColor: AppColors.textColor,
            decoration: InputDecoration(
                fillColor: Theme.of(context).primaryColor,
                focusColor: Theme.of(context).primaryColor,
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(widget.rounded??25.0),
                  borderSide: BorderSide(color: widget.color??AppColors.lightGreyColor, width: 1.0),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(widget.rounded??25.0),
                  borderSide: BorderSide(
                    color: AppColors.primaryColor,
                    width: 1.0,
                  ),
                ),
                contentPadding: EdgeInsets.symmetric(vertical: screenWidth(50),horizontal: screenWidth(50)),
                isDense: true,
                //isCollapsed: true,

                // border: OutlineInputBorder(
                //   borderSide: BorderSide(color: Theme.of(context).primaryColor,),
                //     borderRadius: BorderRadius.circular(8)),
                labelText: widget.labelText,
                labelStyle: TextStyle(color: Theme.of(context).primaryColor),
                constraints: BoxConstraints(
                  maxHeight: context.height * 0.05,
                  maxWidth: context.width * 0.85,
                )),
            //padding: EdgeInsets.all(4),
            hint: FittedBox(
              child: Text(widget.hintText ?? ' ',),
            ),
            items: widget.items
                .map(
                  (e) => DropdownMenuItem<dynamic>(
                value: e[widget.key1],
                child: Text(
                  e[widget.key2].toString(),
                ),
              ),
            )
                .toList(),
            onChanged: widget.onChanged??
                    (val) {
                  setState(() {
                  });
                },
          )),
    );
  }
}
