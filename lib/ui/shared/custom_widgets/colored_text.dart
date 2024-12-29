import 'package:flutter/material.dart';

class ColoredText extends StatelessWidget {
  const ColoredText({super.key,required this.text,required this.textColor,this.size, this.padding, this.leftPadding});
  final String text;
  final Color textColor;
  final double? size;
  final double? padding;
  final double? leftPadding;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(left: leftPadding??12,bottom: padding??8.0,top: padding??12),
          child: FittedBox(child: Text(text,style: TextStyle(fontSize:size?? 20,fontWeight: FontWeight.w500,overflow: TextOverflow.ellipsis,color: textColor),maxLines: 4,softWrap: true,)),
        ),
      ],
    );
  }
}
