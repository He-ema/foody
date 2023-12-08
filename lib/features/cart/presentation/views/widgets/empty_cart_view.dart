import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../../../../../core/utils/styles.dart';

class EmptyCartView extends StatelessWidget {
  const EmptyCartView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 50,
        ),
        const Text(
          'Cart',
          style: Styles.textStyle30,
        ),
        const Divider(),
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Lottie.asset(
                'assets/images/empty2.json',
              ),
              const Text(
                'Your Cart is Empty',
                style: Styles.textStyle25,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
