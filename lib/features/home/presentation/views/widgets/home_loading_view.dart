import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../../../../../constants.dart';
import '../../../../../core/common/widgets/skelton.dart';

class HomeLoadingView extends StatelessWidget {
  const HomeLoadingView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 50,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: kHorizontalPadding),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Skelton(
                      width: 150, height: 20, opacity: 0.4, borderRaduis: 50),
                  const SizedBox(
                    height: 10,
                  ),
                  Skelton(
                      width: 200, height: 20, opacity: 0.4, borderRaduis: 50),
                ],
              ),
              Skelton(width: 50, height: 50, opacity: 0.4, borderRaduis: 15),
            ],
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: kHorizontalPadding),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Skelton(
                  width: MediaQuery.of(context).size.width * 0.73,
                  height: 50,
                  opacity: 0.4,
                  borderRaduis: 15),
              Skelton(width: 50, height: 50, opacity: 0.4, borderRaduis: 15),
            ],
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        SizedBox(
          height: 200,
          child: ListView.builder(
            itemCount: 3,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) => Padding(
              padding: const EdgeInsets.only(left: 15),
              child: Skelton(
                  width: 300, height: 200, opacity: 0.4, borderRaduis: 15),
            ),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Expanded(
            child: GridView.builder(
          itemCount: 6,
          padding: EdgeInsets.zero,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, //number of columns on the screen
            childAspectRatio: 0.8, // نسبىة العرض للطول
            crossAxisSpacing: 10, // spacing between columns
            mainAxisSpacing: 10,
          ),
          itemBuilder: (context, index) => Padding(
            padding: const EdgeInsets.only(left: 15),
            child: Skelton(
                width: 200, height: 200, opacity: 0.4, borderRaduis: 15),
          ),
        ))
      ],
    );
  }
}
