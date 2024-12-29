import '../../../ui/shared/custom_widgets/custom_toast.dart';
import '../../enums/message_type.dart';
import '../../translation/app_translation.dart';

class CommonResponseModel<T> {
  int? statusCode;
  T? data;
  String? message;

  CommonResponseModel.fromJson(dynamic json) {

    this.statusCode = json['statusCode'];
    // this.statusCode = json['response']['code'];

    if (statusCode.toString().startsWith("2"))
      // if (statusCode == 200)
        {
      json['response'] is String?this.data=json['response'] :
        json['response'] is List?this.data = json['response']:
      //this.data = json['response']['data'];
     // json['response'].containsKey('data')?this.data=json['response']['data']['aggregation']
          this.data = json['response'];

    }
    else {
      if (json['response'] != null &&
          json['response'] is Map &&
          // json['response']['title'] != null
          json['response']['error'] != null) {
        // this.message = json['response']['title'];
        this.message = json['response']['error'];
      } else {
        switch (statusCode) {
          case 400:
            this.message = 'the name or passport id should be unique';
            break;
          case 401:
            this.message = 'unautherized';
            break;
          case 404:
            this.message = '404 Not Found';
            break;
          case 500:
            this.message = 'internal server error';
            break;
          case 503:
            this.message = '503 Server unavailable';
            break;
          default:
            this.message = "Opps something went wrong, please try again later!";
        }
      }
    }
  }

  bool get getStatus => statusCode.toString().startsWith("2");
// bool get getStatus => statusCode == 200 ;
}
