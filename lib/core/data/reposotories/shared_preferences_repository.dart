import 'dart:convert';

import 'package:flight_booking_app/app/app_config.dart';
import 'package:flight_booking_app/core/data/models/apis/profile_model.dart';
import 'package:flight_booking_app/core/data/models/apis/token_info_model.dart';
import 'package:flight_booking_app/core/enums/data_type.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesRepository {
  SharedPreferences globalSharedPreferences = Get.find();
  //!--- Keys ----
  String PREF_FIRST_LOGIN = 'first_login';
  String PREF_TOKEN = 'token';
  String PREF_ID = 'id';
  String PREF_PROFILE_INFO = 'profile_info';
  String PREF_APP_LANG = 'app_lang';
  String PREF_CART_LIST = 'cart_list';
  String PREF_NOTIFICATION_FLAG = 'notification_flag';

  // String PREF_COLLEGE_LOGIN = 'college_login';

  void setFirstLogin(bool value) {
    setPreference(
      dataType: DataType.BOOL,
      key: PREF_FIRST_LOGIN,
      value: value,
    );
  }

  bool getFirstLogin() {
    if (globalSharedPreferences.containsKey(PREF_FIRST_LOGIN)) {
      return getPreference(key: PREF_FIRST_LOGIN);
    } else {
      return true;
    }
  }

  void setNotificationFlag(bool value) {
    setPreference(
      dataType: DataType.BOOL,
      key: PREF_NOTIFICATION_FLAG,
      value: value,
    );
  }

  bool getNotificationFlag() {
    if (globalSharedPreferences.containsKey(PREF_NOTIFICATION_FLAG)) {
      return getPreference(key: PREF_NOTIFICATION_FLAG);
    } else {
      return false;
    }
  }



  bool get isLoggedIn => getTokenInfo() != null ? true : false;

  void setTokenInfo(TokenInfoModel value) {
    setPreference(
      dataType: DataType.STRING,
      key: PREF_TOKEN,
      value: jsonEncode(value.toJson()),
    );
  }

  TokenInfoModel? getTokenInfo() {
    if (globalSharedPreferences.containsKey(PREF_TOKEN)) {
      return TokenInfoModel.fromJson(
          jsonDecode(getPreference(key: PREF_TOKEN)));
    } else {
      return null;
    }
  }

  void clearTokenInfo() {
    globalSharedPreferences.clear();
  }

  void setProfileInfo(ProfileModel value) {
    setPreference(
      dataType: DataType.STRING,
      key: PREF_PROFILE_INFO,
      value: jsonEncode(value.toJson()),
    );
  }

  ProfileModel? getProfileInfo() {
    if (globalSharedPreferences.containsKey(PREF_PROFILE_INFO)) {
      return ProfileModel.fromJson(
          jsonDecode(getPreference(key: PREF_PROFILE_INFO)));
    } else {
      return null;
    }
  }

  void setAppLanguage(String value) {
    setPreference(
      dataType: DataType.STRING,
      key: PREF_APP_LANG,
      value: value,
    );
  }

  String getAppLanguage() {
    if (globalSharedPreferences.containsKey(PREF_APP_LANG)) {
      return getPreference(key: PREF_APP_LANG);
    } else {
      return AppConfig.defaultLanguage;
    }
  }


  void setId(int value) {
    setPreference(
      dataType: DataType.INT,
      key: PREF_ID,
      value: value,
    );
  }

  int getId() {
    if (globalSharedPreferences.containsKey(PREF_ID)) {
      return getPreference(key: PREF_ID);
    } else {
      return 0;
    }
  }





  // void setSpecializationsLogin(SpecializationsModel value) {
  //   setPreference(
  //     dataType: DataType.STRING,
  //     key: PREF_COLLEGE_LOGIN,
  //     value: jsonEncode(value.toJson()),
  //   );
  // }

  // SpecializationsModel? getSpecializationsLogin() {
  //   if (globalSharedPreferences.containsKey(PREF_COLLEGE_LOGIN)) {
  //     return SpecializationsModel.fromJson(
  //         jsonDecode(getPreference(key: PREF_COLLEGE_LOGIN)));
  //   } else {
  //     return null;
  //   }
  // }

  //?--

  //!--- Main Function ----
  setPreference({
    required DataType dataType,
    required String key,
    required dynamic value,
  }) async {
    switch (dataType) {
      case DataType.INT:
        await globalSharedPreferences.setInt(key, value);
        break;
      case DataType.BOOL:
        await globalSharedPreferences.setBool(key, value);
        break;
      case DataType.DOUBLE:
        await globalSharedPreferences.setDouble(key, value);
        break;
      case DataType.STRING:
        await globalSharedPreferences.setString(key, value);
        break;
      case DataType.STRINGLIST:
        await globalSharedPreferences.setStringList(key, value);
        break;
      default:
        break;
    }
  }

  getPreference({required String key}) {
    return globalSharedPreferences.get(key);
  }
}
