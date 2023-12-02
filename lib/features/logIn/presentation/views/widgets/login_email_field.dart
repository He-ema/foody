import 'package:flutter/material.dart';

import '../../../../../constants.dart';
import '../../../../../core/common/widgets/custom_text_form_field.dart';

class LoginEmailField extends StatelessWidget {
  const LoginEmailField({
    super.key,
    required this.controller,
  });
  final TextEditingController controller;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: CustomTextFormField(
        hint: 'Email',
        icon: Icon(
          Icons.email,
          color: kPrimaryColor.withOpacity(0.5),
        ),
      ),
    );
  }
}
