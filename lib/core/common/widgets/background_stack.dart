import 'package:flutter/material.dart';
import 'package:foody/core/utils/asset_data.dart';

class BackgroundStack extends StatelessWidget {
  const BackgroundStack({super.key, this.isBig = true, required this.body});
  final bool isBig;
  final Widget body;
  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        SizedBox(
          width: double.infinity,
          child: Image.asset(
            isBig ? AssetData.bigPattern : AssetData.smallPattern,
            fit: BoxFit.fitWidth,
          ),
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Image.asset(
            AssetData.gradient,
            fit: BoxFit.fill,
          ),
        ),
        body,
      ],
    );
  }
}
