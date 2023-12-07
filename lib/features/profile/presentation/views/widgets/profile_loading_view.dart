import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../../../../../constants.dart';

class ProfileLoadingView extends StatelessWidget {
  const ProfileLoadingView({
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
