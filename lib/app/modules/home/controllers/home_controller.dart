import 'package:get/get.dart';
import 'package:video_player/video_player.dart';

class HomeController extends GetxController {
  //TODO: Implement HomeController

  final count = 0.obs;
  late VideoPlayerController videoPlayerController;
  bool isLoading = true;
  double progress = 0;
  String? videoId = '';

  @override
  void onInit() {
    super.onInit();

    if (Get.arguments != null) {
      videoId = Get.arguments;
    }
//https://edilylearning.page.link/7XRm
    //https://d2q0bqp2ryzioz.cloudfront.net/chemistry/reactions/mov/ad498cc0-b9ae-11ed-bb80-61c1e0f2e5ed.mov
    if (videoId != null) {
      videoPlayerController = VideoPlayerController.network(
          'https://d2q0bqp2ryzioz.cloudfront.net/chemistry/reactions/mov/ad498cc0-b9ae-11ed-bb80-61c1e0f2e5ed.mov')
        ..initialize().then((_) => isLoading = false)
        ..addListener(() => _progressListener());
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
    videoPlayerController.dispose();
  }

  _progressListener() {}

  void increment() => count.value++;
}
