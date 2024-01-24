import 'package:flutter/material.dart';
import 'package:foody/constants.dart';
import 'package:foody/core/utils/asset_data.dart';
import 'package:foody/core/utils/styles.dart';

class ChatContainer extends StatelessWidget {
  const ChatContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
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
                AssetData.facebook,
                width: 100,
                height: 100,
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
        ));
  }
}
