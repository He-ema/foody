import 'package:flutter/material.dart';
import 'package:foody/constants.dart';
import 'package:foody/core/utils/styles.dart';

class CustomButton extends StatelessWidget {
  const CustomButton(
      {super.key,
      required this.text,
      required this.onPressed,
      this.enabled = true});
  final String text;
  final bool enabled;
  final void Function() onPressed;
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      disabledColor: Colors.grey,
      onPressed: enabled ? onPressed : null,
      color: kPrimaryColor,
      height: 55,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: Text(
        text,
        style: Styles.textStyle15.copyWith(color: Colors.white),
      ),
    );
  }
}
