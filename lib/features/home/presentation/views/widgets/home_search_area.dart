import 'package:flutter/material.dart';

import '../../../../../constants.dart';
import '../../../../../core/common/custom_icon.dart';
import 'home_text_field.dart';

class HomeSearchArea extends StatelessWidget {
  const HomeSearchArea({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: kHorizontalPadding),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          HomeTextField(),
          CustomIcon(
            icon: Icons.filter_list,
          )
        ],
      ),
    );
  }
}
