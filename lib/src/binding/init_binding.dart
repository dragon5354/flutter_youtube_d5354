import 'package:flutter_youtube_d5354/src/controller/app_controller.dart';
import 'package:get/get.dart';

// 바인딩
class InitBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(AppController());
  }
  
}