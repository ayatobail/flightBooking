import '../../../core/services/base_controller.dart';
import '../../../core/utils/general_utils.dart';
import "package:get/get.dart";
import 'package:video_player/video_player.dart';
import '../login_view/login_view.dart';
import '../main_view/layout_view/layout_view.dart';
class SplashScreenController extends BaseController{
  late VideoPlayerController videoController;
  void onInit(){
    super.onInit();
    videoController = VideoPlayerController.asset('assets/videos/intro.mp4')..initialize().then((_) {
      videoController.play();

    videoController.addListener(() {
      if(videoController.value.position==videoController.value.duration){

        storage.isLoggedIn?
        Get.off(() => layoutView())
            :
        Get.off(() => LogInScreen());
      }
    });
    });
   /* Future.delayed(Duration(seconds: 5)).then((value){
      storage.isLoggedIn?
      Get.off(layoutView())
          :
      Get.off(LogInScreen());
    });*/
  }
  @override
  void onClose() {
    super.onClose();
    videoController.dispose();
  }

}