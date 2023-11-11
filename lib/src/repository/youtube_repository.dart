import 'package:flutter_youtube_d5354/src/models/youtube_video_result.dart';
import 'package:get/get.dart';

class YoutubeRepository extends GetConnect {
  static YoutubeRepository get to => Get.find();

  @override
  void onInit() {
    httpClient.baseUrl = "https://www.googleapis.com";
    super.onInit();
  }

  Future<YoutubeVideoResult?> loadVideos() async {
      String url =
          "/youtube/v3/search?part=snippet&channelId=UCOs1RIIgdvnRYYVuMe5422A&maxResults=10&order=date&type=video&videoDefinition=high&key=AIzaSyD7wFxSNGfc5ALIvNXz-_m_xxt4URB_nMk";
      final response = await get(url);
      if (response.status.hasError) {
        return Future.error(response.statusText as Object);
      } else {
         if (response.body["items"] != null && response.body["items"].length > 0) {
          return YoutubeVideoResult.fromJson(response.body);
         }
        // print(response.body['items']);
      }
    }
}
