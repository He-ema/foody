import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../../../../../constants.dart';

class HomeLoadingView extends StatelessWidget {
  const HomeLoadingView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: SpinKitWave(
        color: kPrimaryColor,
      ),
    );
  }
}
