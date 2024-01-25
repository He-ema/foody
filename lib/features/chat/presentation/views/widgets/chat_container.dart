import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:foody/constants.dart';
import 'package:foody/core/utils/app_router.dart';
import 'package:foody/core/utils/asset_data.dart';
import 'package:foody/core/utils/styles.dart';
import 'package:foody/features/profile/data/models/user_model.dart';
import 'package:go_router/go_router.dart';

class ChatContainer extends StatelessWidget {
  const ChatContainer({
    super.key,
    required this.user,
  });

  final UserModel user;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        GoRouter.of(context).push(AppRouter.chattingPageRoute);
      },
      child: AnimatedContainer(
          duration: const Duration(seconds: 1),
          margin: const EdgeInsets.symmetric(horizontal: kHorizontalPadding),
          decoration: BoxDecoration(
            border: Border.all(width: 0.1),
            boxShadow: const [
              BoxShadow(
                color: Colors.grey,
                offset: Offset(1, 1),
              ),
            ],
            borderRadius: BorderRadius.circular(15),
            color: Colors.white,
          ),
          child: Row(
            children: [
              Container(
                margin: const EdgeInsets.all(10),
                decoration: const BoxDecoration(),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: CachedNetworkImage(
                    imageUrl: user.image,
                    height: 90,
                    placeholder: (context, url) =>
                        const SpinKitSpinningLines(color: kPrimaryColor),
                  ),
                ),
              ),
              const Spacer(),
              Column(
                children: [
                  Text(
                    '${user.firstName} ${user.secondName}',
                    style: Styles.textStyle22,
                  ),
                  Text(
                    'Delivery Service',
                    style: Styles.textStyle20.copyWith(
                        color: Colors.black87, fontWeight: FontWeight.normal),
                  ),
                ],
              ),
              const Spacer(),
            ],
          )),
    );
  }
}
