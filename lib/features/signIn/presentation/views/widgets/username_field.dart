import 'package:flutter/material.dart';

import '../../../../../constants.dart';
import '../../../../../core/common/widgets/custom_text_form_field.dart';

class UsernameField extends StatelessWidget {
  const UsernameField({
    super.key,
    required TextEditingController controller,
  }) : _controller = controller;

  final TextEditingController _controller;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: CustomTextFormField(
        hint: 'username',
        controller: _controller,
        icon: Icon(
          Icons.person,
          color: kPrimaryColor.withOpacity(0.5),
        ),
      ),
    );
  }
}
