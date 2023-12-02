import 'package:flutter/material.dart';
import 'package:foody/constants.dart';
import 'package:foody/core/common/widgets/background_stack.dart';
import 'package:foody/core/common/widgets/custom_button.dart';
import 'package:foody/core/utils/app_router.dart';
import 'package:foody/core/utils/styles.dart';
import 'package:go_router/go_router.dart';

import '../../../data/onBoarding_model.dart';
import 'onBoarding_page_view.dart';

class OnBoardingViewBody extends StatelessWidget {
  const OnBoardingViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const BackgroundStack(
      body: OnBoadrdingPageView(),
    );
  }
}
