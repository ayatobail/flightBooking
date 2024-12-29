import '../network_config.dart';

class AuthEndpoints {
  static String login = NetworkConfig.getFullApiRoute('/api/login');
  static String register = NetworkConfig.getFullApiRoute('/api/register');
}
