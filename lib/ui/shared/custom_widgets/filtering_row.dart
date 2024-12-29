import 'package:flight_booking_app/core/utils/app_sizes.dart';
import '';
import 'package:flutter/material.dart';

import '../../../core/data/models/apis/search_trips_codel.dart';
import '../app_colors.dart';
import '../views_components/utils.dart';
import 'app_drop_down.dart';
import 'label_text.dart';

class FilteringRow extends StatelessWidget {
  const FilteringRow({super.key, required this.flights});
  final List<SearchModel> flights;



  @override
  Widget build(BuildContext context) {
    final List<String> date;
    return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              height: context.height * 0.08,
              child: Row(
                children: [
                  LabelText(
                    labelText: 'Sort by : ',
                    padding: 16,
                  ),
                  AppDropDown(
                      items: ['price', 'date'],
                      width: context.width * 0.25,
                      hintText: 'sorted by',
                    padding: screenWidth(50),
                  ),
                ],
              ),
            ),
           /* IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.filter_list_outlined,
                  color: AppColors.grey,
                  size: 25,
                )),*/
          ],
        ));
  }

  void sort(){
    List<String?> date=[];
    for(SearchModel model in flights){
      date.add(model.departureTime);
    }

  }
}
