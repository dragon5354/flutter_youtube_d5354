import 'package:get/get.dart';

// 앱 종료전까지 유지되어야 해서 GetxService 사용
class AppController extends GetxService {
  static AppController get to => Get.find();

  RxInt currentIndex = 0.obs;

  // 페이지 변경
  void changePageIndex(int index) {
    currentIndex(index);
  }
}
