import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../../../constants.dart';
import 'Profile_success_body.dart';

class ImageArea extends StatelessWidget {
  const ImageArea({
    super.key,
    required this.widget,
  });

  final ProfileSuccessBody widget;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        CircleAvatar(
          radius: MediaQuery.of(context).size.width * 0.26,
          backgroundColor: Colors.grey,
          child: CircleAvatar(
            backgroundColor: kPrimaryColor,
            backgroundImage:
                CachedNetworkImageProvider(widget.state.user.image),
            radius: MediaQuery.of(context).size.width * 0.25,
          ),
        ),
        Positioned(
            bottom: 30,
            right: 70,
            child: GestureDetector(
              onTap: () {},
              child: CircleAvatar(
                radius: MediaQuery.of(context).size.width * 0.06,
                backgroundColor: kPrimaryColor.withOpacity(0.8),
                child: const Icon(
                  Icons.camera_alt_outlined,
                  color: Colors.white,
                  size: 30,
                ),
              ),
            ))
      ],
    );
  }
}
