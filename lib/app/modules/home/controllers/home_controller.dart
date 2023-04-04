import 'package:get/get.dart';
import 'package:video_player/video_player.dart';

import '../../../routes/app_pages.dart';

class HomeController extends GetxController {
  final count = 0.obs;
  VideoPlayerController? videoPlayerController;
  RxBool isLoading = false.obs;
  double progress = 0;

  @override
  void onInit() {
    super.onInit();

    String? videoId = Get.parameters['v'];

    if (videoId != null) {
      isLoading(true);
      videoPlayerController = VideoPlayerController.network(videoId)
        ..initialize().then((_) => isLoading(false));
    }
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
