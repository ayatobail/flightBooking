
import "package:flutter/material.dart";
import "package:get/get.dart";
import 'package:video_player/video_player.dart';

import "../../../core/utils/general_utils.dart";
import "../login_view/login_view.dart";
import "../main_view/layout_view/layout_view.dart";


class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
   //SplashScreenController splashController =Get.put(SplashScreenController());

  late VideoPlayerController _videoPlayerController;

  @override
  void initState() {
    super.initState();
    _videoPlayerController =
    VideoPlayerController.asset('assets/videos/intro.mp4')
      ..initialize().then((_) {
        setState(() {});
        _videoPlayerController.play();
        _videoPlayerController.addListener(() {
          if(_videoPlayerController.value.position==_videoPlayerController.value.duration){

            storage.isLoggedIn?
            Get.off(() => layoutView())
                :
            Get.off(() => LogInScreen());
          }
        });
      });
  }
  @override
  void dispose() {
    _videoPlayerController.dispose();
    super.dispose();
  }



  @override
  Widget build(BuildContext context) {
    return  Scaffold(
     // backgroundColor: Colors.white,
      body:
         SizedBox(
          height:double.infinity,
          //width: screenWidth(1),
          child: VideoPlayer(_videoPlayerController),

        )
      ,


    );
  }
}
