import 'package:flight_booking_app/core/data/network/network_config.dart';

class EndpoinNotifictionts {
  static String notifictionUpdate = NetworkConfig.getFullApiRoute('api/updatetoken');
  static String getAllNotifiction = NetworkConfig.getFullApiRoute('/api/showallnotification');
  static String notificationIsRead = NetworkConfig.getFullApiRoute('/api/makeallread');
}
