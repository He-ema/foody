import 'package:flutter/material.dart';
import 'package:foody/constants.dart';
import 'package:foody/core/utils/app_router.dart';
import 'package:foody/core/utils/asset_data.dart';
import 'package:foody/core/utils/styles.dart';
import 'package:go_router/go_router.dart';

class ChatContainer extends StatelessWidget {
  const ChatContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
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
                child: Image.asset(
                  AssetData.avatar,
                  width: 90,
                  height: 90,
                ),
              ),
              const Spacer(),
              Column(
                children: [
                  const Text(
                    'Name',
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
