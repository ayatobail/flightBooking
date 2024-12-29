import 'package:flight_booking_app/core/utils/app_sizes.dart';
import 'package:flutter/material.dart';

import '../../../shared/app_colors.dart';
import '../../../shared/custom_widgets/custom_bar.dart';
import '../../../shared/custom_widgets/filtering_row.dart';
import '../../../shared/custom_widgets/label_text.dart';
class HotelListView extends StatelessWidget {
  const HotelListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      // appBar: AppBar(
      //   title: LabelText(labelText: 'Flights',padding: 0,),
      // ),
      body: SingleChildScrollView(
        child: SizedBox(
          height: context.height * 1,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Expanded(
                child: Stack(
                  children: [
                    const CustomBar(title: 'Available Flights',),
                    Positioned(
                        top: context.height * 0.15,
                        left: 0,
                        right: 0,
                        bottom: 0,
                        child: Card(
                            elevation: 4,
                            color: Colors.white,
                            shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(18),
                                    topLeft: Radius.circular(18))),
                            child: SizedBox(
                              width: double.infinity,
                              child: Column(
                                children: [
                                  //FilteringRow(),
                                  LabelText(labelText: '8 properties available',),
                                  Expanded(child:
                                  ListView.builder(
                                      shrinkWrap: true,
                                      itemCount: 8,
                                      itemBuilder: (context,index){
                                        return HotelListView();
                                      })
                                  ),

                                ],
                              ),)
                        )
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),


    );
  }
}
