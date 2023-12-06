import 'package:flutter/material.dart';
import 'package:foody/constants.dart';
import 'package:foody/core/utils/app_router.dart';
import 'package:foody/core/utils/asset_data.dart';
import 'package:foody/core/utils/styles.dart';
import 'package:go_router/go_router.dart';

class CongratulationsViewBody extends StatefulWidget {
  const CongratulationsViewBody({super.key});

  @override
  State<CongratulationsViewBody> createState() =>
      _CongratulationsViewBodyState();
}

class _CongratulationsViewBodyState extends State<CongratulationsViewBody> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(
      Duration(seconds: 2),
      () {
        GoRouter.of(context).pushReplacement(AppRouter.bottomNavBarRoute);
      },
    );
  }

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
