import 'package:flutter/material.dart';

import '../../../../../core/utils/asset_data.dart';

class SecondOnBoard extends StatelessWidget {
  const SecondOnBoard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(
          AssetData.secondillustration,
          height: 400,
        ),
        Positioned(
          top: 50,
          left: 20,
          child: Image.asset(AssetData.food9),
        ),
        Positioned(
          right: 0,
          top: 50,
          child: Image.asset(AssetData.food5),
        ),
        Positioned(
          left: 0,
          right: 0,
          bottom: -50,
          child: Image.asset(AssetData.food1),
        ),
      ],
    );
  }
}
