import 'package:flight_booking_app/core/enums/request_type.dart';
import 'package:flight_booking_app/core/utils/general_utils.dart';
import 'package:flight_booking_app/core/utils/network_utils.dart';

class NetworkConfig {
  static String BASE_API = '/api/Darrebni/';

  static String getFullApiRoute(String apiRoute) {
    return  apiRoute;
  }

  static Map<String, String> getHeaders({
    bool? needAuth = true,
    bool? needHost = true,
    required RequestType requestType,
    Map<String, String>? extraHeaders = const {},
  }) {
    return {
      if (needAuth!)
        "Authorization": "Bearer ${storage.getTokenInfo()?.token ?? ''}",
      if (needHost!) "Host": NetworkUtil.baseUrl,
      if (requestType != RequestType.GET) "Content-Type": "application/json",
      ...extraHeaders!
    };
  }
}
