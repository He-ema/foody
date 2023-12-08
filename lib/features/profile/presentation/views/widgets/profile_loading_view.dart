import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../../../../../constants.dart';
import '../../../../../core/common/widgets/skelton.dart';

class ProfileLoadingView extends StatelessWidget {
  const ProfileLoadingView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kHorizontalPadding),
      child: Column(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.15,
          ),
          Skelton(
              width: MediaQuery.of(context).size.width * 0.5,
              height: MediaQuery.of(context).size.width * 0.5,
              opacity: 0.4,
              borderRaduis: 100),
          const SizedBox(
            height: 30,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Skelton(
                  width: MediaQuery.of(context).size.width * 0.35,
                  height: 50,
                  opacity: 0.4,
                  borderRaduis: 15),
              Skelton(
                  width: MediaQuery.of(context).size.width * 0.35,
                  height: 50,
                  opacity: 0.4,
                  borderRaduis: 15),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Skelton(
              width: MediaQuery.of(context).size.width,
              height: 50,
              opacity: 0.4,
              borderRaduis: 15),
          const SizedBox(
            height: 20,
          ),
          Skelton(
              width: MediaQuery.of(context).size.width,
              height: 50,
              opacity: 0.4,
              borderRaduis: 15),
          const SizedBox(
            height: 50,
          ),
          Skelton(
              width: MediaQuery.of(context).size.width * 0.35,
              height: 50,
              opacity: 0.4,
              borderRaduis: 15),
        ],
      ),
    );
  }
}
