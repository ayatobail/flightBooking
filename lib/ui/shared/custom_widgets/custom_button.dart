import 'package:flutter/material.dart';

import '../app_colors.dart';

class AppButton extends StatelessWidget {
  const AppButton(
      {Key? key,
        required this.onTap,
        required this.buttonText,
        this.btnWidth,
        this.btnHeight,
        this.color,
        this.s
      })
      : super(key: key);
  final Function() onTap;
  final String buttonText;
  final double? btnWidth;
  final double? btnHeight;
  final Color? color;
  final double? s;

  @override
  Widget build(BuildContext context) {
    final size =MediaQuery.of(context).size;
    return SizedBox(
      width: btnWidth ?? size.width * 0.8,
      height: btnHeight ?? size.height* 0.06,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
        ),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            elevation: 0,
            backgroundColor: color ?? AppColors.primaryColor,
          ) ,
          onPressed: onTap,
          child:Text(buttonText,
              style: TextStyle(color:Colors.white,fontSize: s?? size.width *0.05)),

        ),
      ),
    );
  }
}