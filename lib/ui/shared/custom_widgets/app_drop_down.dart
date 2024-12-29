import 'package:flight_booking_app/core/utils/app_sizes.dart';
import 'package:flight_booking_app/ui/shared/views_components/utils.dart';
import 'package:flutter/material.dart';
import '../app_colors.dart';

class AppDropDown extends StatefulWidget {
  AppDropDown(
      {super.key,
      required this.items,
      this.hintText,
      this.labelText,
      this.isConst = true,
      this.value,
      this.onChanged,
      this.width,
      this.rounded,
      this.color,
      this.validator,
      this.prefIcon,
      this.padding});

  final List items;
  String? hintText;
  String? labelText;
  final bool isConst;
  double? width;
  double? rounded;
  double? padding;
  Color? color;
  String? Function(dynamic)? validator;
  dynamic? value;
  IconData? prefIcon;

  final Function(dynamic val)? onChanged;

  @override
  State<AppDropDown> createState() => _AppDropDownState();
}

class _AppDropDownState extends State<AppDropDown> {
  @override
  Widget build(BuildContext context) {
    FocusNode focus=new FocusNode();
    return Container(
        // color: Colors.white,
      margin: EdgeInsets.only(top: 10.0,left: 16.0,right: 16.0,bottom: 0),
        width: widget.width ?? context.width * 0.85,
       // height: screenHeight(10),
        child: DropdownButtonFormField<dynamic>(
          validator: widget.validator,
          value: widget.value,
          isExpanded: false,
          dropdownColor: AppColors.backgroundColor,
          borderRadius: BorderRadius.circular(12),
          focusColor: AppColors.textColor,
          decoration: InputDecoration(
              prefixIcon: widget.prefIcon != null ?Icon(widget.prefIcon) : null,
              fillColor: Theme.of(context).primaryColor,
              focusColor: Theme.of(context).primaryColor,
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(widget.rounded ?? 25.0),
                borderSide: BorderSide(
                    color: widget.color ?? AppColors.lightGreyColor,
                    width: 1.0),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular( 12),
                borderSide: BorderSide(
                  color: AppColors.primaryColor,
                  width: 1.0,
                ),
              ),
              isDense: true,
              isCollapsed: false,
              contentPadding: EdgeInsets.symmetric(vertical: screenWidth(50),horizontal: widget.padding??0),

              // border: OutlineInputBorder(
              //   borderSide: BorderSide(color: Theme.of(context).primaryColor,),
              //     borderRadius: BorderRadius.circular(8)),
              labelText: widget.labelText,
              labelStyle: TextStyle(color: focus.hasFocus?widget.color??Theme.of(context).primaryColor:widget.color,fontSize: 15),
             ),
          //itemHeight: screenWidth(30),
          //padding: EdgeInsets.all(4),
          menuMaxHeight: screenWidth(2),
          hint: FittedBox(
            child: Text(
              widget.hintText ?? ' ',

            ),
          ),
          items: widget.items
              .map(
                (e) => DropdownMenuItem<dynamic>(
                  value: e,
                  child: Text(
                    e.toString(),

                  ),
                ),
              )
              .toList(),
          onChanged: widget.onChanged ??
              (val) {
                setState(() {
                  widget.hintText = val.toString();
                });
              },
          style: TextStyle(fontSize: 13,color: AppColors.textColor),
        ));
  }
}
