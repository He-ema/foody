import 'package:flutter/material.dart';

import '../../../../../constants.dart';

class PaymentTextField extends StatelessWidget {
  const PaymentTextField(
      {super.key, this.autoFocus = false, required this.label});
  final bool autoFocus;
  final String label;
  @override
  Widget build(BuildContext context) {
    bool isError = false;
    return TextFormField(
      onTapOutside: (event) {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      validator: (value) {
        if (value!.isEmpty ?? true) {
          isError = true;
          return 'this field can\'t be empty';
        }
      },
      cursorColor: kPrimaryColor,
      keyboardType: TextInputType.number,
      autofocus: autoFocus,
      decoration: InputDecoration(
        labelText: label,
        labelStyle: const TextStyle(fontWeight: FontWeight.bold),
        floatingLabelStyle: const TextStyle(color: kPrimaryColor),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: const Color.fromARGB(255, 14, 13, 13),
          ),
          borderRadius: BorderRadius.circular(5),
        ),
        enabledBorder: createBorder(),
        border: createBorder(),
        focusedBorder: createBorder(isEnabled: true),
      ),
    );
  }

  OutlineInputBorder createBorder(
          {bool isEnabled = false}) =>
      OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: BorderSide(
              width: isEnabled ? 2 : 1,
              color:
                  isEnabled ? kPrimaryColor : kPrimaryColor.withOpacity(0.9)));
}
