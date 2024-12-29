import '../network_config.dart';

class ServicesEndpoints {
  static String getServices = NetworkConfig.getFullApiRoute('/api/services');
  static String getSubServices = NetworkConfig.getFullApiRoute('/api/subservice');
  static String bookService = NetworkConfig.getFullApiRoute('/api/requestservice');
  static String showMyServices = NetworkConfig.getFullApiRoute('/api/showservices');
  static String showSubServicesInfo = NetworkConfig.getFullApiRoute('/api/showsubservice');
}
