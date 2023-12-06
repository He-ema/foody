import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../constants.dart';
import '../../../../../core/common/widgets/background_stack.dart';
import '../../../../../core/utils/asset_data.dart';
import '../../../../../core/utils/styles.dart';
import 'home_search_area.dart';
import 'notification_icon.dart';

class MyAppBar extends StatelessWidget {
  const MyAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      floating: true,
      automaticallyImplyLeading: false,
      pinned: true,
      backgroundColor: Colors.white,
      expandedHeight: MediaQuery.of(context).size.height * 0.20,
      flexibleSpace: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          var top = 0.0;
          top = constraints.biggest.height;
          return FlexibleSpaceBar(
            centerTitle: true,
            collapseMode: CollapseMode.parallax,
            title: AnimatedOpacity(
                duration: const Duration(milliseconds: 300),
                opacity:
                    top == MediaQuery.of(context).padding.top + kToolbarHeight
                        ? 1.0
                        : 0.0,
                child: SvgPicture.asset(AssetData.appName)),
            background: const BackgroundStack(
              body: Column(
                children: [
                  SizedBox(
                    height: 50,
                  ),
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: kHorizontalPadding),
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
                  SizedBox(
                    height: 18,
                  ),
                  HomeSearchArea(),
                  SizedBox(
                    height: 16,
                  ),
                  // AutoSlidableCards(),
                ],
              ),
              isBig: false,
            ),
          );
        },
      ),
    );
  }
}
