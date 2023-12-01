import 'package:flutter/material.dart';
import 'package:foody/features/onBoarding/presentation/views/widgets/first_onBorad.dart';
import 'package:foody/features/onBoarding/presentation/views/widgets/second_onBorading.dart';

class OnboardModel {
  final Widget images;
  final String description;
  final String title;

  OnboardModel(
      {required this.images, required this.description, required this.title});
}

List<OnboardModel> onBoardList = [
  OnboardModel(
      images: const FirstOnBoard(),
      description:
          'Here You Can find a chef or dish for every taste and color. Enjoy!',
      title: 'Find your Comfort\nFood here'),
  OnboardModel(
      images: const SecondOnBoard(),
      description: 'Enjoy a fast and smooth food delivery at your doorstep',
      title: 'DIDFOOD is Where Your Comfort Food Lives'),
];
