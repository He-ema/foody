import 'package:flutter/material.dart';
import 'package:foody/core/common/widgets/background_stack.dart';

import 'logo_part.dart';

class SplashViewBody extends StatelessWidget {
  const SplashViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const BackgroundStack(
      body: LogoPart(),
    );
  }
}
