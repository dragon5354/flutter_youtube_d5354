import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class YoutubeDetail extends StatelessWidget {
  const YoutubeDetail({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text(Get.parameters["videoId"]!),
      ),
    );
  }
}
