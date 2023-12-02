import 'package:flutter/material.dart';

import '../../../../../constants.dart';
import '../../../../../core/common/widgets/custom_text_form_field.dart';

class PasswordField extends StatelessWidget {
  const PasswordField({
    super.key,
    required TextEditingController controller3,
  }) : _controller3 = controller3;

  final TextEditingController _controller3;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: CustomTextFormField(
        isPassword: true,
        hint: 'Password',
        controller: _controller3,
        icon: Icon(
          Icons.lock,
          color: kPrimaryColor.withOpacity(0.5),
        ),
      ),
    );
  }
}
