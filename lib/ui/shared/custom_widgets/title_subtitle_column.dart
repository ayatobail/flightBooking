
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import '../app_colors.dart';
import 'label_text.dart';

class TitleSubtitleColumn extends StatelessWidget {
  const TitleSubtitleColumn({super.key,required this.title, this.subtitle,this.color, this.htmlView, this.size, this.align, this.titleSize,});
  final String title;
  final String? subtitle;
  final Color? color;
  final dynamic? htmlView;
  final double? size;
  final double? titleSize;
  final dynamic? align;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: align??CrossAxisAlignment.start,
      children: [
       align!=null? Text(title): LabelText(labelText: title,padding: 0,color: color,size: titleSize,),
        subtitle==null? Html(data:htmlView ,):
        Text(subtitle??"",softWrap:true,maxLines: 2,style: TextStyle(color:AppColors.textColor,fontWeight: FontWeight.w500,fontSize: size??20),)
      ],
    );
  }
}
