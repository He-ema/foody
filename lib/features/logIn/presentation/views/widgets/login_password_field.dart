import 'package:flutter/material.dart';

import '../../../../../constants.dart';
import '../../../../../core/common/widgets/custom_text_form_field.dart';

class LoginPasswordField extends StatelessWidget {
  const LoginPasswordField({
    super.key,
    required this.controller,
  });
  final TextEditingController controller;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: CustomTextFormField(
        isPassword: true,
        hint: 'Password',
        icon: Icon(
          Icons.lock,
          color: kPrimaryColor.withOpacity(0.5),
        ),
      ),
    );
  }
}
