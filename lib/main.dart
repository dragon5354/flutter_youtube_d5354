import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_youtube_d5354/src/binding/init_binding.dart';
import 'package:flutter_youtube_d5354/src/app.dart';
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
      theme: ThemeData(
        primaryColor: Colors.white,
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: "/", // 시작 경로 설정
      initialBinding: InitBinding(),
      getPages: [
        GetPage(name: "/", page: ()=>App())
      ],

    );
  }
}