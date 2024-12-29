import 'package:dartz/dartz.dart';

import 'package:flight_booking_app/core/data/models/apis/search_trips_codel.dart';

import '../../enums/request_type.dart';
import '../../utils/network_utils.dart';
import '../models/apis/my_trips_model.dart';
import '../models/common_response.dart';
import '../network/endpoints/trips_endpoints.dart';
import '../network/network_config.dart';

class TripsRepository {
  Future<Either<String, List<MyTripsModel>>>
      getAllTrips() //ازا صح بترجع موديل وازا لا بترجع string
  async {
    try {
      return NetworkUtil.sendRequest(
        type: RequestType.GET,
        url: TripsEndpoints.getMyTrips,
        headers: NetworkConfig.getHeaders(
            needAuth: true, requestType: RequestType.GET),
      ).then((response) {
        CommonResponseModel<List<dynamic>> commonResponse =
            CommonResponseModel.fromJson(response);

        if (commonResponse.getStatus) {
          List<MyTripsModel> result = [];
          commonResponse.data!.forEach((element) {
            result.add(MyTripsModel.fromJson(element));
          });
          return Right(result);
        } else {
          return Left(commonResponse.message ?? '');
        }
      });
    } catch (e) {
      return Left(e.toString());
    }
  }

  Future<Either<String,  List<SearchModel>>> onwaySearch({
    required String from,
    required String to,
    required String date,
    String? returndate,
    required String adultsNum,
    required String children,
    required String infants,
    required String classType,
  }) //ازا صح بترجع موديل وازا لا بترجع string
  async {
    try {
      return NetworkUtil.sendRequest(
        type: RequestType.GET,
        url: TripsEndpoints.onewaySearch,
        params: {
          "from": from ,
          "to": to,
          "date": date,
         if(returndate!=null) "returndate":returndate,
          "adults": adultsNum ,
          "children": children ,
          "infants": infants ,
          "class": classType
        },
        headers: NetworkConfig.getHeaders(
            needAuth: true, requestType: RequestType.GET),
      ).then((response) {
        CommonResponseModel<dynamic> commonResponse =
            CommonResponseModel.fromJson(response);

        if (commonResponse.getStatus) {
          List<SearchModel> result = [];
          commonResponse.data!.forEach((element) {
            result.add(SearchModel.fromJson(element));
          });
          return Right(result);
        } else {
          return Left(commonResponse.message ?? '');
        }
      });
    } catch (e) {
      return Left(e.toString());
    }
  }





  Future<Either<String, List<SearchModel>>> roundTripSearch(
      String from,
      String to,
      String date,
      String returnDate,
      String adultsNum,
      String children,
      String infants,
      String classType,) //ازا صح بترجع موديل وازا لا بترجع string
  async {
    try {
      return NetworkUtil.sendRequest(
        type: RequestType.GET,
        url: TripsEndpoints.roundTripSearch,
        params: {
          "from": from ,
          "to": to,
          "departure_date": date,
          "return_date" :returnDate,
          "adults": adultsNum ,
          "children": children ,
          "infants": infants ,
          "class": classType,
        },
        headers: NetworkConfig.getHeaders(
            needAuth: false, requestType: RequestType.GET),
      ).then((response) {
        CommonResponseModel<List<dynamic>> commonResponse =
        CommonResponseModel.fromJson(response);

        if (commonResponse.getStatus) {
          List<SearchModel> result = [];
          commonResponse.data!.forEach((element) {
            result.add(SearchModel.fromJson(element));
          });
          return Right(result);
        } else {
          return Left(commonResponse.message ?? '');
        }
      });
    } catch (e) {
      return Left(e.toString());
    }
  }
  static Future<Either<String, dynamic>> bookFlight({
    required String name,
    required String from,
    required String to,
    required String depaturedate,
    required String returndate,
    required String cost,
    required String id,
  required String image,
  required String depature_time,
  required String arrival_time,
  required String depature_airport,
  required String arrival_airport,
  required String type,
  required List<String> images}) async {
    Map<String,String> result={};
    images.map((e){
      result["images[${images.indexOf(e)}]"]=e.toString();
    }).toSet();
    try {
      return NetworkUtil.sendMultipartRequest(type: RequestType.POST,
        url: TripsEndpoints.bookFlight,
        fields: {
        "name":name,
        "from":from,
          "to":to,
          "depaturedate":depaturedate,
          "returndate":returndate,
          "cost":cost,
          "id":id,
          "image":image,
          "type":type,
          "depature_time":depature_time,
          "arrival_time":arrival_time,
          "depature_airport":depature_airport,
          "arrival_airport":arrival_airport,
        },
        files: {...result},
        headers: NetworkConfig.getHeaders(
          needAuth: true,
          requestType: RequestType.POST,
        ), requestType: RequestType.POST,
      ).then((response) {
        /* if (response == null) {
          return Left("الرجاء التحقق من الانترنت");
        }*/
        CommonResponseModel<dynamic> commonResponse =
        CommonResponseModel.fromJson(response);

        if (commonResponse.getStatus) {
           return Right("your request sent successfully");
        } else {
          return Left(commonResponse.message ?? '');
        }
      });
    } catch (e) {
      return Left(e.toString());
    }
  }

}
