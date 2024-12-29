import 'package:flight_booking_app/core/utils/app_sizes.dart';
import 'package:flutter/material.dart';
import '../../shared/app_colors.dart';
import '../../shared/custom_widgets/colored_text.dart';
import '../../shared/custom_widgets/custom_bar.dart';
import '../../shared/custom_widgets/custom_button.dart';
import '../../shared/custom_widgets/title_subtitle_column.dart';
class FlightDetailsView extends StatefulWidget {
  const FlightDetailsView({Key? key}) : super(key: key);

  @override
  _FlightDetailsViewState createState() => _FlightDetailsViewState();
}

class _FlightDetailsViewState extends State<FlightDetailsView> {
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
                    const CustomBar(title: 'Flight Details',),
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
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,                                children: [
                                Center(child: Image.asset('assets/images/airlines_logo.png',fit: BoxFit.cover,width: context.width*0.2),),
                                Expanded(
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Container(
                                        width: context.width*0.4,
                                        margin: EdgeInsets.all(12),
                                        padding: EdgeInsets.symmetric(horizontal: 18,vertical: 8),
                                        child: Column(
                                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            ColoredText(text: 'Sydney', textColor: AppColors.primaryColor),
                                            Icon(
                                              Icons.flight_takeoff_outlined,
                                              size: context.width * 0.1,
                                              color: AppColors.secondaryColor,
                                            ),
                                            Text('23h 25m',style: TextStyle(color: AppColors.lightGreyColor,fontWeight: FontWeight.w200,fontSize: 14),),
                                            ColoredText(text: 'London', textColor: AppColors.primaryColor),
                                            TitleSubtitleColumn(title: 'Depart', subtitle: '8:30 AM'),
                                            TitleSubtitleColumn(title: 'Flight No', subtitle: 'EK008'),
                                            TitleSubtitleColumn(title: 'Traveller No', subtitle: '01'),
                                            TitleSubtitleColumn(title: 'Seat No', subtitle: '17'),
                                            TitleSubtitleColumn(title: 'Ticket Price', subtitle: '\$ 790'),

                                          ],),
                                      ),
                                      Expanded(
                                        child: Container(
                                          // width: context.width*0.5,
                                          margin: EdgeInsets.all(12),
                                          padding: EdgeInsets.all(12),
                                          decoration: BoxDecoration(
                                              color: AppColors.lightGreyColor,
                                              borderRadius: BorderRadius.circular(18)
                                          ),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.min,
                                            crossAxisAlignment: CrossAxisAlignment.center,
                                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                            children: [
                                              Text('Economy Class',style: TextStyle(fontSize: 18,fontWeight: FontWeight.w500,color: AppColors.grey),),

                                              Text('Select a seat',style: TextStyle(color: AppColors.grey,fontWeight: FontWeight.w200,fontSize: 14),),
                                              Expanded(
                                                child: GridView.builder(
                                                    shrinkWrap: true,
                                                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                                      childAspectRatio: 0.7,
                                                      // mainAxisExtent: 150,
                                                      crossAxisCount:4,
                                                      crossAxisSpacing: 12,
                                                      mainAxisSpacing: 12,
                                                    ),
                                                    padding: EdgeInsets.all(8),
                                                    itemCount: 30,
                                                    itemBuilder: (context,index){
                                                      return Container(
                                                        width: context.width*0.05,
                                                        height: context.width*0.12,
                                                        decoration: BoxDecoration(
                                                          borderRadius: BorderRadius.circular(12),
                                                          border: Border.all(
                                                              color: Colors.white,
                                                              width: 2
                                                          ),
                                                          color:index ==17?AppColors.secondaryColor: index % 3 ==0 ?AppColors.grey : Colors.transparent ,
                                                        ),
                                                      );
                                                    }),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(12.0),
                                  child: AppButton(onTap: (){}, buttonText: 'Checkout',),
                                )
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
