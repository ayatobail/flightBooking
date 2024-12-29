import 'package:flight_booking_app/core/data/models/apis/search_trips_codel.dart';
import 'package:flight_booking_app/core/services/base_controller.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';

import '../../../../core/enums/message_type.dart';
import '../../../shared/custom_widgets/custom_toast.dart';
class FlightListController extends BaseController{

   RxList<SearchModel> flights=RxList<SearchModel>([]);
   RxList<SearchModel> filteredFlights=RxList<SearchModel>([]);
   RxSet<String> airlines=RxSet<String>();
   RxBool hasFilteredResult=RxBool(false);

  FlightListController(List<SearchModel> trips){
    flights.clear();
   flights.addAll(trips);
   getAirlines();

  }

  void sortByDate(){
    if(filteredFlights.isNotEmpty)
    {filteredFlights.sort((a,b)=>a.departureTime!.compareTo(b.departureTime!));}
    this.flights.sort((a,b)=>a.departureTime!.compareTo(b.departureTime!));
  }

   void sortByPrice(){
    if(filteredFlights.isNotEmpty)
     {filteredFlights.sort((a,b)=>a.total!.compareTo(b.total!));}
    this.flights.sort((a,b)=>a.total!.compareTo(b.total!));

   }
void getAirlines(){
    airlines.value={"all", ...flights.where((item) => item.nameairline!=null).map((e) => e.nameairline!).toSet()};

}
   void filterFlights({String? value}){
     filteredFlights.clear();
     value=="all"?filteredFlights.value.addAll(flights):
     filteredFlights.value=flights.where((item) => item.nameairline!.contains(value!)).toList();
     hasFilteredResult.value=filteredFlights.isNotEmpty;
     if(!hasFilteredResult.value){
       hasFilteredResult.value=true;
       CustomToast.showMessage(
           message: "No result founded", messageType: MessageType.INFO);
     }

   }

   @override
  void onClose() {

    // TODO: implement onClose
    super.onClose();
  }
}