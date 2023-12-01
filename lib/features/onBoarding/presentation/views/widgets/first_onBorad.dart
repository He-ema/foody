import 'package:flutter/material.dart';

import '../../../../../core/utils/asset_data.dart';

class FirstOnBoard extends StatelessWidget {
  const FirstOnBoard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(
          AssetData.bigIllustration,
          height: 400,
        ),
        Positioned(
          top: 20,
          left: 0,
          child: Image.asset(AssetData.food10),
        ),
        Positioned(
          right: 0,
          top: 50,
          child: Image.asset(AssetData.food4),
        ),
        Positioned(
          left: 0,
          right: 0,
          bottom: -50,
          child: Image.asset(AssetData.food7),
        ),
      ],
    );
  }
}
