import 'package:flutter_youtube_d5354/src/models/statistics.dart';
import 'package:flutter_youtube_d5354/src/models/youtube_video_result.dart';
import 'package:flutter_youtube_d5354/src/models/youtuber.dart';
import 'package:get/get.dart';

class YoutubeRepository extends GetConnect {
  static YoutubeRepository get to => Get.find();

  @override
  void onInit() {
    httpClient.baseUrl = "https://www.googleapis.com";
    super.onInit();
  }

  /*
  * 만들기에 따라 아래 3개를 하나로 합치는것도 가능할것 같긴 함
  * (받아오는 url 설정에 따라)
  */

  // 썸네일, 이름 , 유튜버이름, 날짜 받아오기
  Future<YoutubeVideoResult?> loadVideos(String nextPageToken) async {
    String url =
        "/youtube/v3/search?part=snippet&channelId=UCOs1RIIgdvnRYYVuMe5422A&maxResults=10&order=date&type=video&videoDefinition=high&key=AIzaSyD7wFxSNGfc5ALIvNXz-_m_xxt4URB_nMk&pageToken=$nextPageToken";
    final response = await get(url);
    if (response.status.hasError) {
      return Future.error(response.statusText as Object);
    } else {
      if (response.body["items"] != null && response.body["items"].length > 0) {
        return YoutubeVideoResult.fromJson(response.body);
      }
    }
  }
  
  // 조회수 받아오기
  Future<Statistics?> getVideoInfoById(String videoId) async {
    String url =
        "/youtube/v3/videos?part=snippet,statistics&key=AIzaSyD7wFxSNGfc5ALIvNXz-_m_xxt4URB_nMk&id=$videoId";
    final response = await get(url);
    if (response.status.hasError) {
      return Future.error(response.statusText as Object);
    } else {
      if (response.body["items"] != null && response.body["items"].length > 0) {
        Map<String, dynamic> data = response.body["items"][0];
        return Statistics.fromJson(data["statistics"]);
      }
    }
  }

  // 유튜버 이미지
  Future<Youtuber?> getYoutuberInfoById(String channelId) async {
    String url =
        "/youtube/v3/channels?part=statistics,snippet&key=AIzaSyD7wFxSNGfc5ALIvNXz-_m_xxt4URB_nMk&id=$channelId";
    final response = await get(url);
    if (response.status.hasError) {
      return Future.error(response.statusText as Object);
    } else {
      if (response.body["items"] != null && response.body["items"].length > 0) {
        Map<String, dynamic> data = response.body["items"][0];
        return Youtuber.fromJson(data);
      }
    }
  }


}
