import '../network_config.dart';

class TripsEndpoints {
  static String getMyTrips = NetworkConfig.getFullApiRoute('/api/showflight');
  static String onewaySearch = NetworkConfig.getFullApiRoute('/api/oneway');
  static String roundTripSearch = NetworkConfig.getFullApiRoute('/api/roundtrip');
  static String bookFlight = NetworkConfig.getFullApiRoute('/api/booking');

}