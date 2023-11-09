import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_youtube_d5354/src/components/custom_appbar.dart';

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
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: 150,
              color: Colors.grey,
            ),
          );
        }))
      ],
    ));
  }
}
