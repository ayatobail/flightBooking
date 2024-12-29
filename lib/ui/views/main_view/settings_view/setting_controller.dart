import 'package:flight_booking_app/core/services/base_controller.dart';
import 'package:flutter_share/flutter_share.dart';
class SettingController extends BaseController{
Future<void> shareApp() async{
  final String appLink="";


  await FlutterShare.share(title:'Share App With',text:"It's fast, simple, and secure app. ",linkUrl: appLink);
  //await SharePlus.in
}
}