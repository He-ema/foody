import 'package:flutter/material.dart';

import '../../../../../core/common/widgets/custom_text_form_field.dart';

class FirstNameField extends StatelessWidget {
  const FirstNameField({
    super.key,
    required TextEditingController controller,
  }) : _controller = controller;

  final TextEditingController _controller;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: CustomTextFormField(
        controller: _controller,
        hint: 'First Name',
      ),
    );
  }
}
