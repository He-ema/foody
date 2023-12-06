import 'package:flutter/material.dart';

import '../../../../../constants.dart';

class HomeTextField extends StatelessWidget {
  const HomeTextField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.75,
      child: TextField(
        decoration: InputDecoration(
          prefixIcon: const Icon(
            Icons.search_rounded,
            color: kPrimaryColor,
            size: 30,
          ),
          hintText: 'What do you want to order ?',
          hintStyle: const TextStyle(color: Colors.grey),
          filled: true,
          fillColor: kPrimaryColor.withOpacity(0.1),
          border: createBorder(),
          enabledBorder: createBorder(),
          focusedBorder: createBorder(),
          disabledBorder: createBorder(),
        ),
      ),
    );
  }

  OutlineInputBorder createBorder() {
    return OutlineInputBorder(
        borderRadius: BorderRadius.circular(16), borderSide: BorderSide.none);
  }
}
