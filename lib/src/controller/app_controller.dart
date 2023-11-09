import 'package:flutter/cupertino.dart';
import 'package:flutter_youtube_d5354/src/components/youtube_bottom_sheet.dart';
import 'package:get/get.dart';

enum RouteName { Home, Explore, Add, Subs, Library }

// 앱 종료전까지 유지되어야 해서 GetxService 사용
class AppController extends GetxService {
  static AppController get to => Get.find();

  RxInt currentIndex = 0.obs;

  // 페이지 변경
  void changePageIndex(int index) {
    // Add가 아닐 때만
    if(RouteName.values[index] == RouteName.Add) {
      _showBottomSheet();
    } else {
      currentIndex(index);
    }
  }

  void _showBottomSheet() {
    Get.bottomSheet(YoutubeBottomSheet());
  }


}
