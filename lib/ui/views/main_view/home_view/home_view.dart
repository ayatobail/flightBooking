import 'package:flight_booking_app/core/utils/app_sizes.dart';
import 'package:flutter/material.dart';
import '../../../shared/custom_widgets/custom_bar.dart';
import '../../../shared/views_components/tab_bar_component.dart';
import 'tab_bar_views/search_trips_view/search_trips_view.dart';
import 'tab_bar_views/services_view/services_view.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: CustomAppBar(),
      body: SingleChildScrollView(
        child: SizedBox(
          height: context.height * 1,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Expanded(
                child: Stack(
                  children: [
                    const CustomBar(title: 'Book Your Flight Now'),
                    Positioned(
                        top: context.height * 0.18,
                        left: 0,
                        right: 0,
                        bottom: 0,
                        child:  DefaultTabController(
                          length: 3,
                          child: Column(
                            children: [
                              TabBarComponent(),
                              Expanded(
                                child: TabBarView(
                                    children: [
                                      SearchTripsView(isRoundTrip: true,),
                                      SearchTripsView(),
                                    //  ChooseHotelDetailsCard(),
                                    //  ChooseCarDetailsCard(),
                                      ServicesView()
                                    ]),
                              ),
                            ],
                          ),
                        ))
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
