import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:foody/core/utils/app_router.dart';
import 'package:go_router/go_router.dart';
import 'package:hive/hive.dart';

import '../../../../../constants.dart';
import '../../../../../core/utils/asset_data.dart';

class LogoPart extends StatefulWidget {
  const LogoPart({super.key});

  @override
  State<LogoPart> createState() => _LogoPartState();
}

class _LogoPartState extends State<LogoPart>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<Offset> slidingAnimation;
  bool appeared = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initSlidingAnimation();
    changeOpacity();
    navigateMethod();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    if (this.mounted) {
      animationController.dispose();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        AnimatedOpacity(
          duration: const Duration(seconds: 1),
          opacity: appeared == false ? 0 : 1,
          child: Image.asset(
            AssetData.logo,
            height: 300,
          ),
        ),
        AnimatedBuilder(
          animation: slidingAnimation,
          builder: (context, child) => SlideTransition(
            position: slidingAnimation,
            child: SvgPicture.asset(AssetData.appName),
          ),
        ),
        const SizedBox(
          height: 150,
        ),
      ],
    );
  }

  void initSlidingAnimation() {
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );

    slidingAnimation = Tween<Offset>(
      begin: const Offset(0, 20),
      end: Offset.zero,
    ).animate(animationController);
    animationController.forward();
  }

  void changeOpacity() {
    Future.delayed(
      const Duration(seconds: 1),
      () {
        appeared = true;
        setState(() {});
      },
    );
  }

  void navigateMethod() {
    Future.delayed(
      const Duration(seconds: 3),
      () {
        var box = Hive.box(kEmail);

        box.get(kEmail) == null
            ? GoRouter.of(context).pushReplacement(AppRouter.onBoardingRoute)
            : GoRouter.of(context).pushReplacement(AppRouter.bottomNavBarRoute);
      },
    );
  }
}
