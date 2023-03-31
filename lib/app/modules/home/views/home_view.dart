import 'package:edily_web_video_player/app/components/edily_loader.dart';
import 'package:edily_web_video_player/app/modules/home/views/video_controls.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:video_player/video_player.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  HomeView({Key? key}) : super(key: key);

  @override
  HomeController controller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /* appBar: AppBar(
        title: const Text('Edily'),
        centerTitle: true,
      ),*/
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        color: Colors.black87,
        padding: const EdgeInsets.all(100),
        child: Center(
          child: controller.isLoading
              ? const EdilyLoader(
                  type: LoaderType.random,
                  size: Size(140, 140),
                )
              : controller.videoPlayerController.value.isInitialized
                  ? AspectRatio(
                      aspectRatio:
                          controller.videoPlayerController.value.aspectRatio,
                      child: Stack(
                        alignment: Alignment.bottomCenter,
                        children: [
                          VideoPlayer(controller.videoPlayerController),
                          ControlsOverlay(
                              controller: controller.videoPlayerController),
                          VideoProgressIndicator(
                            controller.videoPlayerController,
                            allowScrubbing: true,
                          ),
                        ],
                      ),
                    )
                  : Container(),
        ),
      ),
    );
  }
}
