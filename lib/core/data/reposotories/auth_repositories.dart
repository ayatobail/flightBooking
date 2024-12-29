import 'package:dartz/dartz.dart';
import 'package:flight_booking_app/core/data/models/apis/token_info_model.dart';
import 'package:flight_booking_app/core/data/models/common_response.dart';

import 'package:flight_booking_app/core/data/network/endpoints/auth_endpoints.dart';
import 'package:flight_booking_app/core/data/network/network_config.dart';
import 'package:flight_booking_app/core/enums/request_type.dart';
import 'package:flight_booking_app/core/utils/network_utils.dart';

class AuthRepositories {
  static Future<Either<String, TokenInfoModel>> register({required String name,
    required String email,
    required String phone,
    required String password,}) async {
    try {
      return NetworkUtil.sendRequest(type: RequestType.POST,
          url: AuthEndpoints.register,
          body: {
            'name': name,
            'email': email,
            'phone': phone,
            'password': password},
        headers: NetworkConfig.getHeaders(
        needAuth: false,
        requestType: RequestType.POST,
      ),
      ).then((response) {
        /* if (response == null) {
          return Left("الرجاء التحقق من الانترنت");
        }*/
        CommonResponseModel<dynamic> commonResponse =
        CommonResponseModel.fromJson(response);

        if (commonResponse.getStatus) {
          return Right(TokenInfoModel.fromJson(commonResponse.data ?? {}));
        } else {
          return Left(commonResponse.message ?? '');
        }
      });
    } catch (e) {
      return Left(e.toString());
    }
  }

  Future<Either<String, TokenInfoModel>> login({
    required String phone,
    required String password,
  }) async {
    try {
      return NetworkUtil.sendRequest(
        type: RequestType.POST,
        url: AuthEndpoints.login,
        body: {'phone': phone, 'password': password},

        headers: NetworkConfig.getHeaders(
          needAuth: false,
          requestType: RequestType.POST,
        ),
      ).then((response) {
        CommonResponseModel<dynamic> commonResponse =
        CommonResponseModel.fromJson(response);

        if (commonResponse.getStatus) {
          return Right(TokenInfoModel.fromJson(commonResponse.data ?? {}));
        } else {
          return Left(commonResponse.message ?? '');
        }
      });
    } catch (e) {
      return Left(e.toString());
    }
  }
}
