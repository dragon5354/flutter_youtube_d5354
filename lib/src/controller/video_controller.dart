import 'package:flutter_youtube_d5354/src/models/statistics.dart';
import 'package:flutter_youtube_d5354/src/models/video.dart';
import 'package:flutter_youtube_d5354/src/models/youtuber.dart';
import 'package:flutter_youtube_d5354/src/repository/youtube_repository.dart';
import 'package:get/get.dart';

class VideoController extends GetxController {
  Video video;
  VideoController({required this.video});
  Rx<Statistics> statistics = Statistics().obs;
  Rx<Youtuber> youtuber = Youtuber().obs;

  @override
  void onInit() async {
    Statistics? loadStatistics =
        await YoutubeRepository.to.getVideoInfoById(video.id.videoId);
    statistics(loadStatistics);
    Youtuber? loadyoutuber =
        await YoutubeRepository.to.getYoutuberInfoById(video.snippet.channelId!);
    youtuber(loadyoutuber);
    super.onInit();
  }

  String get viewCountString => "조회수 ${statistics.value.viewCount ?? '-'}회";
  String get youtuberThumbnailUrl {
    if(youtuber.value.snippet == null) {
      return "https://icon-library.com/images/guest-icon-png/guest-icon-png-6.jpg";
    } else {
      return youtuber.value.snippet!.thumbnails!.medium.url;
    }
  }
}
