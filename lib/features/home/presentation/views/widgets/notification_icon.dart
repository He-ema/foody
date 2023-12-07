import 'package:flutter/material.dart';

import '../../../../../core/common/custom_icon.dart';

class NotificationIcon extends StatelessWidget {
  const NotificationIcon({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CustomIcon(
          icon: Icons.notifications_none_outlined,
          onTap: () {},
        ),
        const Positioned(
            top: 12,
            right: 13,
            child: CircleAvatar(
              radius: 5,
              backgroundColor: Colors.red,
            )),
      ],
    );
  }
}
