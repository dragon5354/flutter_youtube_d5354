import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_youtube_d5354/src/components/custom_appbar.dart';
import 'package:flutter_youtube_d5354/src/components/video_widget.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/get_navigation.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: CustomScrollView(
      slivers: [
        SliverAppBar(
          title: CustomAppBar(),
          floating: true,
          snap: true,
        ),
        SliverList(delegate: SliverChildBuilderDelegate((context, index) {
          return GestureDetector(
            onTap: () {
              // page route
              Get.toNamed("/detail/123456");
            },
            child: VideoWidget(),
          );
        }))
      ],
    ));
  }
}
