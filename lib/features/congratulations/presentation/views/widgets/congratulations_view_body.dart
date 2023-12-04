import 'package:flutter/material.dart';
import 'package:foody/constants.dart';
import 'package:foody/core/utils/asset_data.dart';
import 'package:foody/core/utils/styles.dart';

class CongratulationsViewBody extends StatelessWidget {
  const CongratulationsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Image.asset(
          AssetData.congrats,
          height: 160,
        ),
        const SizedBox(
          height: 30,
        ),
        Text(
          'Congrats!',
          textAlign: TextAlign.center,
          style: Styles.textStyle30.copyWith(color: kPrimaryColor),
        ),
        const SizedBox(
          height: 10,
        ),
        const Text(
          'Your Profile Is Ready To Use',
          textAlign: TextAlign.center,
          style: Styles.textStyle22,
        ),
      ],
    );
  }
}
