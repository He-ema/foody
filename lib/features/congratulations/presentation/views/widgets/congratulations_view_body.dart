import 'package:flutter/material.dart';
import 'package:foody/core/utils/asset_data.dart';

class CongratulationsViewBody extends StatelessWidget {
  const CongratulationsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(AssetData.congrats),
        SizedBox(
          height: 30,
        ),
        Text('Congratulations !'),
        Text('Your Profile Is Ready To Use'),
      ],
    );
  }
}
