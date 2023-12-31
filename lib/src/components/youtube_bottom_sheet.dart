import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class YoutubeBottomSheet extends StatelessWidget {
  const YoutubeBottomSheet({super.key});

  // 헤더 부분(만들기와 x)
  Widget _header() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "만들기",
          style: TextStyle(fontSize: 16),
        ),
        IconButton(
          icon: Icon(Icons.close),
          onPressed: Get.back,
        )
      ],
    );
  }

  // 버튼 형식
  Widget _itemButton(
      {required String icon,
      required double iconSize,
      required String label,
      Function()? onTap}) {
    return InkWell(
      onTap: onTap,
      child: Row(
        children: [
          Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.grey.withOpacity(0.3),
            ),
            child: Center(
              child: Container(
                width: iconSize,
                height: iconSize,
                child: SvgPicture.asset("assets/svg/icons/$icon.svg"),
              ),
            ),
          ),
          SizedBox(width: 15),
          Text(label)
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(20),
        topRight: Radius.circular(20),
      ),
      child: Container(
        padding: const EdgeInsets.only(left: 20),
        height: 200,
        color: Colors.white,
        child: Column(
          children: [
            // 헤더
            _header(),
            SizedBox(height: 10),
            // 버튼 1
            _itemButton(
              icon: "upload",
              iconSize: 17,
              label: "동영상 업로드",
              onTap: () {
                print("동영상 업로드 기능");
              },
            ),
            SizedBox(height: 10),
            // 버튼 2
            _itemButton(
              icon: "broadcast",
              iconSize: 25,
              label: "실시간 스트리밍 시작",
              onTap: () {
                print("실시간 스트리밍 시작 기능");
              },
            ),
          ],
        ),
      ),
    );
  }
}
