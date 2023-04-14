import 'package:edily_web_video_player/app/modules/not_found/bindings/not_found_binding.dart';
import 'package:edily_web_video_player/app/modules/not_found/views/not_found_view.dart';
import 'package:get/get.dart';

import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.Video;

  static final routes = [
    GetPage(
      name: _Paths.Video,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.Error,
      page: () => NotFoundView(),
      binding: NotFoundBinding(),
    ),
  ];
}
