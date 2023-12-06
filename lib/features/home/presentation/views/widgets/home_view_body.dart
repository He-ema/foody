import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:foody/constants.dart';
import 'package:foody/core/utils/styles.dart';
import 'package:foody/features/home/presentation/views/widgets/auto_slidable_cards.dart';

import 'home_search_area.dart';
import 'notification_icon.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      physics: NeverScrollableScrollPhysics(),
      slivers: [
        SliverToBoxAdapter(
          child: Column(
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
              const HomeSearchArea(),
              const SizedBox(
                height: 16,
              ),
              AutoSlidableCards(),
            ],
          ),
        ),
        SliverFillRemaining(
          child: MasonryGridView.builder(
            padding: EdgeInsets.zero,
            itemCount: 10,
            gridDelegate: const SliverSimpleGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2),
            itemBuilder: (context, index) => Container(
              margin: const EdgeInsets.all(10),
              color: Colors.grey,
              height: 50,
            ),
          ),
        ),
      ],
    );
  }
}
