import 'package:flutter/material.dart';
import 'package:foody/constants.dart';

class CustomTextFormField extends StatefulWidget {
  CustomTextFormField(
      {super.key,
      required this.hint,
      this.maxLines = 1,
      this.onSaved,
      this.onChanged,
      this.controller,
      this.icon,
      this.color,
      this.enabled,
      this.isPassword = false});
  final TextEditingController? controller;
  final String hint;
  final int maxLines;
  final void Function(String?)? onSaved;
  final Function(String)? onChanged;
  final Icon? icon;
  final bool isPassword;
  Color? color;
  bool obscureText = true;
  IconButton? iconButton;
  bool? enabled;
  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  @override
  Widget build(BuildContext context) {
    bool isUername = false;
    widget.hint == 'User Name' ? isUername = true : false;
    return TextFormField(
      onTapOutside: (event) {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      enabled: widget.enabled,
      obscureText: (widget.isPassword && widget.obscureText),
      controller: widget.controller,
      onChanged: widget.onChanged,
      onSaved: widget.onSaved,
      validator: (value) {
        if (value!.isEmpty ?? true) {
          return 'This field can\'t be empty';
        } else {
          if (isUername && value.contains(' ')) {
            return 'Username cant have spaces';
          } else {
            return null;
          }
        }
      },
      maxLines: widget.maxLines,
      decoration: InputDecoration(
        suffixIcon: widget.isPassword
            ? GestureDetector(
                onTap: () {
                  widget.obscureText = !widget.obscureText;
                  setState(() {});
                },
                child: widget.obscureText
                    ? const Icon(
                        Icons.visibility,
                        color: kPrimaryColor,
                      )
                    : Icon(Icons.visibility_off,
                        color: kPrimaryColor.withOpacity(0.5)))
            : null,
        filled: true,
        fillColor: widget.color ?? Colors.white,
        prefixIcon: widget.icon,
        border: buildBorder(kPrimaryColor),
        hintText: widget.hint,
        hintStyle: const TextStyle(color: Colors.grey),
        enabledBorder: buildBorder(kPrimaryColor),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: const BorderSide(
              width: 1,
              color: kPrimaryColor,
            )),
      ),
    );
  }

  OutlineInputBorder buildBorder([color]) {
    return OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: BorderSide(
          width: 0.1,
          color: color ?? const Color.fromARGB(255, 107, 106, 106),
        ));
  }
}
