
import 'package:get/get.dart';

import '../../../../core/enums/bottom_Navigation.dart';
import '../../../../core/services/base_controller.dart';

class BottomNavigationController extends BaseController {
  BottomNavigationController(BottomNavigationEnum type) {
    enumType.value = type;
  }
  Rx<BottomNavigationEnum> enumType = BottomNavigationEnum.HOME.obs;
}