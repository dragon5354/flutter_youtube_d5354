import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_youtube_d5354/src/binding/init_binding.dart';
import 'package:flutter_youtube_d5354/src/app.dart';
import 'package:flutter_youtube_d5354/src/components/youtube_detail.dart';
import 'package:flutter_youtube_d5354/src/controller/youtube_detail_controller.dart';
import 'package:flutter_youtube_d5354/src/controller/youtube_search_controller.dart';
import 'package:flutter_youtube_d5354/src/pages/youtube_search.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: "Youtube Clone App",
      // theme: ThemeData(
      //   primaryColor: Colors.white,
      //   primarySwatch: Colors.blue,
      //   visualDensity: VisualDensity.adaptivePlatformDensity,
      // ),
      // primaryColor로는 이제 테마색상이 안바뀜
      theme: ThemeData().copyWith(
          colorScheme: ThemeData()
              .colorScheme
              .copyWith(primary: Colors.white, secondary: Colors.grey)),
      initialRoute: "/", // 시작 경로 설정
      initialBinding: InitBinding(),
      getPages: [
        GetPage(name: "/", page: () => App()),
        GetPage(
            name: "/detail/:videoId",
            page: () => YoutubeDetail(),
            binding: BindingsBuilder(
              () => Get.lazyPut<YoutubeDetailController>(
                  () => YoutubeDetailController()),
            )),
        GetPage(
            name: "/search",
            page: () => YoutubeSearch(),
            binding: BindingsBuilder(
              () => Get.lazyPut<YoutubeSearchController>(
                  () => YoutubeSearchController()),
            )),
      ],
    );
  }
}
