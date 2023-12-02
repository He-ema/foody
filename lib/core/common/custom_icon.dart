import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../constants.dart';

class CustomIcon extends StatelessWidget {
  const CustomIcon({super.key, this.onTap});
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap ??
          () {
            GoRouter.of(context).pop();
          },
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: kPrimaryColor.withOpacity(0.1),
          borderRadius: BorderRadius.circular(15),
        ),
        child: const Icon(
          Icons.arrow_back_ios_new,
          color: kPrimaryColor,
          size: 30,
        ),
      ),
    );
  }
}
