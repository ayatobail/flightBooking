import 'package:flight_booking_app/core/utils/app_sizes.dart';
import 'package:flutter/material.dart';
import '../../app_colors.dart';
import '../../custom_widgets/colored_text.dart';

class WalletInfoCard extends StatelessWidget {
  const WalletInfoCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12)
      ),

      color: AppColors.primaryColor,
      // margin: EdgeInsets.all(12),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
            // TitleSubtitleColumn(title: 'Available Balance', subtitle: '\$ 1200.50'),

                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ColoredText(text: 'Available Balance',textColor: Colors.white70,),
                    Padding(
                      padding: EdgeInsets.only(left: 12,bottom: 12.0,top: 0),
                      child: Text(' \$ 1200.50',style: TextStyle(color: AppColors.secondaryColor,fontWeight: FontWeight.w500,fontSize: 20),),
                    )
                  ],
                ),
                Image.asset('assets/images/visa.png',fit: BoxFit.cover,width: context.width*0.12),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
            // TitleSubtitleColumn(title: 'Account Number', subtitle: '1900 8988 4321'),


                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ColoredText(text: 'Account Number',textColor: Colors.white70,),
                    Padding(
                      padding: EdgeInsets.only(left: 12,bottom: 8.0,top: 0),
                      child: Text('1900 8988 4321',style: TextStyle(color: AppColors.grey,fontWeight: FontWeight.w500,fontSize: 20),),
                    )
                  ],
                ),
               IconButton(onPressed: (){}, icon: Icon(Icons.qr_code_scanner_rounded,size: 30,color: AppColors.secondaryColor,))
                 ],
            ),
          ],
        ),
      ),
    );
  }
}
