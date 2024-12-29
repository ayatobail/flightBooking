import 'package:flight_booking_app/core/utils/app_sizes.dart';

import 'package:flutter/material.dart';

class HotelDetailsCard extends StatelessWidget {
  const HotelDetailsCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Row(
        children: [
          Image.asset('assets/images/hotel.jpg',width: context.width*0.2,),
          Expanded(
            child: Column(
              children: [
                Text('Comfort Hotel Copenhagen Airport',style: TextStyle(fontWeight: FontWeight.w700,fontSize: 20),),
                // Wrap(children: [
                //   Icon(Icons.star,color: Colors.yellow,),
                //   Text('4.5'),
                //   Text('(150 reviews)',style: TextStyle(color: AppColors.grey),)
                // ],),
                // Row(
                //   children: [
                //     Text('\$ 160'),
                //     OutlinedButton(onPressed: (){}, child: Text('view deasls',style: TextStyle(color: AppColors.secondaryColor),))
                //   ],
                // )
              ],
            ),
          )
        ],
      ),
    );
  }
}
