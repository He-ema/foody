import 'package:flutter/material.dart';
import 'package:foody/core/utils/styles.dart';

class OutsideRegisteration extends StatelessWidget {
  const OutsideRegisteration(
      {super.key,
      required this.name,
      required this.image,
      required this.onPressed});
  final String name;
  final String image;
  final void Function() onPressed;
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      color: Colors.white,
      onPressed: onPressed,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        children: [
          Image.asset(image),
          const SizedBox(
            width: 5,
          ),
          Text(
            name,
            style: Styles.textStyle15,
          ),
        ],
      ),
    );
  }
}
