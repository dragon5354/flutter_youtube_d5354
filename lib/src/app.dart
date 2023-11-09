// 시작시 최초로 보여주는 페이지
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_youtube_d5354/src/controller/app_controller.dart';
import 'package:flutter_youtube_d5354/src/pages/explore.dart';
import 'package:flutter_youtube_d5354/src/pages/home.dart';
import 'package:flutter_youtube_d5354/src/pages/library.dart';
import 'package:flutter_youtube_d5354/src/pages/subscribe.dart';
import 'package:get/get.dart';

// 컨트롤러에 바로 접근 가능하게
class App extends GetView<AppController> {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Obx(() {
          switch(RouteName.values[controller.currentIndex.value]){
            case RouteName.Home:
              return Home();
            case RouteName.Explore:
              return Explore();             
            case RouteName.Subs:
              return Subscribe();
            case RouteName.Library:
              return Library();
            case RouteName.Add:
              // bottomsheet 사용예정  
            default:
              return Container();
          }
        }),
        // 반응형 상태관리 적용할 부분을 obx로 표시
        bottomNavigationBar: Obx(
          () => BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            currentIndex: controller.currentIndex.value,
            showSelectedLabels: true,
            selectedItemColor: Colors.black,
            onTap: controller.changePageIndex, // 눌렀을때 변경
            items: [
              BottomNavigationBarItem(
                  icon: SvgPicture.asset("assets/svg/icons/home_off.svg"),
                  activeIcon: SvgPicture.asset("assets/svg/icons/home_on.svg"),
                  label: "홈"),
              BottomNavigationBarItem(
                  icon: SvgPicture.asset(
                    "assets/svg/icons/compass_off.svg",
                    width: 22,
                  ),
                  activeIcon: SvgPicture.asset(
                    "assets/svg/icons/compass_on.svg",
                    width: 22,
                  ),
                  label: "탐색"),
              BottomNavigationBarItem(
                  icon: Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: SvgPicture.asset(
                      "assets/svg/icons/plus.svg",
                      width: 35,
                    ),
                  ),
                  label: ""),
              BottomNavigationBarItem(
                  icon: SvgPicture.asset(
                    "assets/svg/icons/subs_off.svg",
                  ),
                  activeIcon: SvgPicture.asset(
                    "assets/svg/icons/subs_on.svg",
                  ),
                  label: "구독"),
              BottomNavigationBarItem(
                  icon: SvgPicture.asset(
                    "assets/svg/icons/library_off.svg",
                  ),
                  activeIcon: SvgPicture.asset(
                    "assets/svg/icons/library_on.svg",
                  ),
                  label: "보관함"),
            ],
          ),
        ));
  }
}
