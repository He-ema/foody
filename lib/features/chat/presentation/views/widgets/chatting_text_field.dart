import 'package:flutter/material.dart';
import 'package:foody/constants.dart';

class ChattingTextField extends StatelessWidget {
  const ChattingTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return TextField(
      onTapOutside: (event) {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      decoration: InputDecoration(
        hintText: 'Type Here',
        filled: true,
        fillColor: Colors.white,
        suffixIcon: IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.send,
            color: kPrimaryColor,
          ),
        ),
        border: createBorder(),
        errorBorder: createBorder(),
        focusedBorder: createBorder(),
        disabledBorder: createBorder(),
        enabledBorder: createBorder(),
      ),
    );
  }

  OutlineInputBorder createBorder() => OutlineInputBorder(
      borderRadius: BorderRadius.circular(15),
      borderSide: const BorderSide(width: 1));
}
