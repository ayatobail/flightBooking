
import 'package:flutter/material.dart';

import '../app_colors.dart';

class LabelText extends StatelessWidget {
  const LabelText({super.key,this.padding,required this.labelText,  this.color, this.size});
  final String labelText;
  final double? padding;
  final Color? color;
  final double? size;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(left:padding ?? 12,bottom: 2.0,top: 8.0),
          child: FittedBox(child: Text(labelText,style: TextStyle(fontSize:size?? 18,fontWeight: FontWeight.w500,overflow: TextOverflow.ellipsis,color: color??AppColors.grey),maxLines: 4,)),
        ),
      ],
    );
  }
}
