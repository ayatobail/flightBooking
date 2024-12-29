import 'package:flight_booking_app/core/data/models/notification_model.dart';
import 'package:flight_booking_app/core/data/network/endpoints/notification_endpoints.dart';import 'package:dartz/dartz.dart';

import '../../enums/request_type.dart';
import '../../utils/network_utils.dart';
import '../models/apis/token_info_model.dart';
import '../models/common_response.dart';
import '../network/network_config.dart';

class NotificationsRepositories {
  static Future<Either<String, dynamic>> updateNotifications(
      String? token) async {
    try {
      return NetworkUtil.sendRequest(type: RequestType.PUT,
        url: EndpoinNotifictionts.notifictionUpdate,
        params: {
          "token": token},
        headers: NetworkConfig.getHeaders(
          needAuth: true,
          requestType: RequestType.PUT,
        ),
      ).then((response) {
        /* if (response == null) {
          return Left("الرجاء التحقق من الانترنت");
        }*/
        CommonResponseModel<dynamic> commonResponse =
        CommonResponseModel.fromJson(response);

        if (commonResponse.getStatus) {
          return Right("success");
        } else {
          return Left(commonResponse.message ?? '');
        }
      });
    } catch (e) {
      return Left(e.toString());
    }
  }


  Future<Either<String, List<NotificationModel>>> getAllNotifications() //ازا صح بترجع موديل وازا لا بترجع string
  async {
    try {
      return NetworkUtil.sendRequest(
        type: RequestType.GET,
        url: EndpoinNotifictionts.getAllNotifiction,
        headers: NetworkConfig.getHeaders(
            needAuth: true, requestType: RequestType.GET),
      ).then((response) {
        CommonResponseModel<dynamic> commonResponse =
        CommonResponseModel.fromJson(response);

        if (commonResponse.getStatus) {
          List<NotificationModel> result = [];
          commonResponse.data!.forEach((element) {
            result.add(NotificationModel.fromJson(element));
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

   Future<Either<String, dynamic>> readNotification(
  {required String notificationId}) async {
    try {
      return NetworkUtil.sendRequest(type: RequestType.GET,
        url: EndpoinNotifictionts.notificationIsRead,
        params: {
          "id": notificationId},
        headers: NetworkConfig.getHeaders(
          needAuth: true,
          requestType: RequestType.GET,
        ),
      ).then((response) {
        /* if (response == null) {
          return Left("الرجاء التحقق من الانترنت");
        }*/
        CommonResponseModel<dynamic> commonResponse =
        CommonResponseModel.fromJson(response);

        if (commonResponse.getStatus) {
          return Right("success");
        } else {
          return Left(commonResponse.message ?? '');
        }
      });
    } catch (e) {
      return Left(e.toString());
    }
  }

}
