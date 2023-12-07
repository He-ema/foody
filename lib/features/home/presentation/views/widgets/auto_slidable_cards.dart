import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:foody/core/utils/asset_data.dart';

class AutoSlidableCards extends StatefulWidget {
  AutoSlidableCards({super.key});

  @override
  State<AutoSlidableCards> createState() => _AutoSlidableCardsState();
}

class _AutoSlidableCardsState extends State<AutoSlidableCards> {
  final myImages = [
    Image.asset(AssetData.advertise),
    Image.asset(AssetData.advertise1),
    Image.asset(AssetData.advertise2),
    Image.asset(AssetData.advertise3),
  ];

  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: SingleChildScrollView(
        child: Column(
          children: [
            CarouselSlider(
                items: myImages,
                options: CarouselOptions(
                  autoPlay: true,
                  enlargeCenterPage: true,
                  height: 200,
                  autoPlayAnimationDuration: const Duration(milliseconds: 800),
                  autoPlayInterval: const Duration(seconds: 2),
                  enableInfiniteScroll: true,
                  aspectRatio: 2,
                  onPageChanged: (index, reason) {
                    setState(() {});
                    currentIndex = index;
                  },
                ))
          ],
        ),
      ),
    );
  }
}
