import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:video_player/video_player.dart';

import '../../../routes/app_pages.dart';

class HomeController extends GetxController {
  final count = 0.obs;
  VideoPlayerController? videoPlayerController;
  RxBool isLoading = true.obs;
  double progress = 0;

  @override
  void onInit() {
    super.onInit();

    String? videoId = Get.parameters['v'];

    if (videoId != null) {
      _initializeVideo(videoId);
    } else {
      _notFound();
    }
  }

  void _initializeVideo(String videoId) {
    videoPlayerController = VideoPlayerController.network(videoId)
      ..initialize().then((_) => isLoading(false)).onError((error, stackTrace) {
        _notFound();
        return true;
      });
  }

  void _notFound() {
    WidgetsBinding.instance
        .addPostFrameCallback((timeStamp) => Get.offNamed(Routes.Error));
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  @override
  void dispose() {
    super.dispose();
    videoPlayerController?.dispose();
  }

  void increment() => count.value++;
}
