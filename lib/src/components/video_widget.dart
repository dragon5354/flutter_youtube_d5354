import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_youtube_d5354/src/controller/video_controller.dart';
import 'package:flutter_youtube_d5354/src/models/video.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class VideoWidget extends StatefulWidget {
  final Video video;
  const VideoWidget({super.key, required this.video});

  @override
  State<VideoWidget> createState() => _VideoWidgetState();
}

class _VideoWidgetState extends State<VideoWidget> {
  late VideoController _videoController;

  @override
  void initState() {
    _videoController = Get.put(VideoController(video: widget.video),
        tag: widget.video.id.videoId);
    super.initState();
  }

  Widget _thumbnail() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Container(
          color: Colors.grey.withOpacity(0.5),
          child: CachedNetworkImage(
            imageUrl: widget.video.snippet.thumbnails!.medium.url,
            placeholder: (context, url) => Container(
              height: 230,
              child: Center(child: CircularProgressIndicator()),
            ),
            fit: BoxFit.fitWidth,
          ),
        ),
      ],
    );
  }

  Widget _simpleDetailinfo() {
    return Container(
      padding: EdgeInsets.only(left: 10, bottom: 20),
      child: Row(
        children: [
          Obx(
            () => CircleAvatar(
              radius: 30,
              backgroundColor: Colors.grey.withOpacity(0.5),
              backgroundImage:
                  Image.network(_videoController.youtuberThumbnailUrl).image,
            ),
          ),
          SizedBox(
            width: 15,
          ),
          Expanded(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                        child: Text(
                      widget.video.snippet.title!,
                      maxLines: 2,
                    )),
                    IconButton(
                      alignment: Alignment.topCenter,
                      icon: Icon(Icons.more_vert, size: 18),
                      onPressed: () {},
                    )
                  ],
                ),
                Row(
                  children: [
                    Text(
                      widget.video.snippet.channelTitle!,
                      style: TextStyle(
                          fontSize: 12, color: Colors.black.withOpacity(0.8)),
                    ),
                    Text(" . "),
                    Obx(
                      () => Text(
                        _videoController.viewCountString,
                        style: TextStyle(
                            fontSize: 12, color: Colors.black.withOpacity(0.8)),
                      ),
                    ),
                    Text(" . "),
                    Text(
                      DateFormat("yyyy-MM-dd")
                          .format(widget.video.snippet.publishTime!),
                      style: TextStyle(
                          fontSize: 12, color: Colors.black.withOpacity(0.8)),
                    )
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          _thumbnail(),
          _simpleDetailinfo(),
        ],
      ),
    );
  }
}
