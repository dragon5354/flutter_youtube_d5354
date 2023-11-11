import 'package:flutter/material.dart';
import 'package:flutter_youtube_d5354/src/models/youtube_video_result.dart';
import 'package:flutter_youtube_d5354/src/repository/youtube_repository.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  static HomeController get to => Get.find();

  Rx<YoutubeVideoResult> youtubeResult = YoutubeVideoResult(items: []).obs;
  ScrollController scrollController = ScrollController();

  @override
  void onInit() {
    // TODO: implement onInit
    _videoLoad();
    _event();
    super.onInit();
  }

  void _event() {
    scrollController.addListener(() {
      if (scrollController.position.pixels ==
              scrollController.position.maxScrollExtent &&
          youtubeResult.value.nextPagetoken != "") {
        _videoLoad();
      }
    });
  }

  void _videoLoad() async {
    YoutubeVideoResult? youtubeVideoResult = await YoutubeRepository.to
        .loadVideos(youtubeResult.value.nextPagetoken ?? "");

    if (youtubeVideoResult != null &&
        youtubeVideoResult.items != null &&
        youtubeVideoResult.items!.length > 0) {
      youtubeResult.update((youtube) {
        youtube!.nextPagetoken = youtubeVideoResult.nextPagetoken;
        youtube.items!.addAll(youtubeVideoResult.items!);
      });
      // youtubeResult(youtubeVideoResult);
    }
  }
}
