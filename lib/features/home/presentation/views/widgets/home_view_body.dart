import 'package:flutter/material.dart';
import 'package:foody/constants.dart';
import 'package:foody/core/common/custom_icon.dart';
import 'package:foody/core/utils/styles.dart';
import 'package:foody/features/home/presentation/views/widgets/auto_slidable_cards.dart';

import 'home_text_field.dart';
import 'notification_icon.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 50,
        ),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: kHorizontalPadding),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Find Your \nfavourite Food',
                style: Styles.textStyle30,
              ),
              NotificationIcon()
            ],
          ),
        ),
        const SizedBox(
          height: 18,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: kHorizontalPadding),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              HomeTextField(),
              CustomIcon(
                icon: Icons.filter_list,
              )
            ],
          ),
        ),
        SizedBox(
          height: 16,
        ),
        AutoSlidableCards(),
      ],
    );
  }
}
