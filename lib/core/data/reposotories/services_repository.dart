import 'package:flight_booking_app/core/data/models/apis/services_models/sub_sevice_info_model.dart';

import '../../../ui/shared/custom_widgets/custom_toast.dart';
import '../../enums/message_type.dart';
import '../../utils/network_utils.dart';
import '../models/apis/services_models/my_services_model.dart';
import '../models/apis/services_models/service_model.dart';
import '../models/apis/my_trips_model.dart';
import 'package:dartz/dartz.dart';
import 'package:flight_booking_app/core/data/models/apis/search_trips_codel.dart';

import '../../enums/request_type.dart';
import '../../utils/network_utils.dart';
import '../models/apis/my_trips_model.dart';
import '../models/common_response.dart';
import '../network/endpoints/servicec_endpoints.dart';
import '../network/endpoints/trips_endpoints.dart';
import '../network/network_config.dart';

class ServicesRepository {
  Future<Either<String, dynamic>>
      getAllServices() //ازا صح بترجع موديل وازا لا بترجع string
  async {
    try {
      return NetworkUtil.sendRequest(
        type: RequestType.GET,
        url: ServicesEndpoints.getServices,
        headers: NetworkConfig.getHeaders(
            needAuth: true, requestType: RequestType.GET),
      ).then((response) {
        CommonResponseModel<List<dynamic>> commonResponse =
            CommonResponseModel.fromJson(response);

        if (commonResponse.getStatus) {
          List<dynamic> result = [];
          commonResponse.data!.forEach((element) {
            result.add(element);
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

  Future<Either<String, dynamic>>
  getSubServices(String id) //ازا صح بترجع موديل وازا لا بترجع string
  async {
    try {
      return NetworkUtil.sendRequest(
        type: RequestType.GET,
        url: ServicesEndpoints.getSubServices,
        params: {"id":id},
        headers: NetworkConfig.getHeaders(
            needAuth: true, requestType: RequestType.GET),
      ).then((response) {
        CommonResponseModel<List<dynamic>> commonResponse =
        CommonResponseModel.fromJson(response);

        if (commonResponse.getStatus) {
          List<dynamic> result = [];
          commonResponse.data!.forEach((element) {
            result.add(element);
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

  Future<Either<String, String>> bookService(
      String id,
      String name,
      String num,
      String description,
       String image) //ازا صح بترجع موديل وازا لا بترجع string
  async {
    try {
      return NetworkUtil.sendMultipartRequest(
        type: RequestType.POST,
        url: ServicesEndpoints.bookService,
        fields: {
          'name': name,
          'id': id,
          'num': num,
          'note': description
        },
        files: {'image':image},
        headers: NetworkConfig.getHeaders(

            needAuth: true, requestType: RequestType.POST),
        requestType: RequestType.POST,
      ).then((response) {
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






  Future<Either<String, List<MyServicesModel>>> showMyServices(
      String id,
     )
  async {
    try {
      return NetworkUtil.sendRequest(
        type: RequestType.GET,
        url: ServicesEndpoints.showMyServices,
        params: {
        'id':id
        },

        headers: NetworkConfig.getHeaders(

            needAuth: true, requestType: RequestType.GET),
      ).then((response) {
        CommonResponseModel<dynamic> commonResponse =
        CommonResponseModel.fromJson(response);

        if (commonResponse.getStatus) {
          List<MyServicesModel> result = [];
          commonResponse.data!.forEach((element) {
            result.add(MyServicesModel.fromJson(element));
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


  Future<Either<String, SubServicesInfoModel>> showSubServiceInfo({
    required String id,
  }) async {
    try {
      return NetworkUtil.sendRequest(
        type: RequestType.GET,
        url: ServicesEndpoints.showSubServicesInfo,
        params: {"id":id},

        headers: NetworkConfig.getHeaders(
          needAuth: true,
          requestType: RequestType.GET,
        ),
      ).then((response) {
        CommonResponseModel<dynamic> commonResponse =
        CommonResponseModel.fromJson(response);

        if (commonResponse.getStatus) {
          return Right(SubServicesInfoModel.fromJson(commonResponse.data ?? {}));
        } else {
          return Left(commonResponse.message ?? '');
        }
      });
    } catch (e) {
      return Left(e.toString());
    }
  }


}
