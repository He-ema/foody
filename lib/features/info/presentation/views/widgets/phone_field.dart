import 'package:flutter/material.dart';

import '../../../../../core/common/widgets/custom_text_form_field.dart';

class PhoneField extends StatelessWidget {
  const PhoneField({
    super.key,
    required TextEditingController controller3,
  }) : _controller3 = controller3;

  final TextEditingController _controller3;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: CustomTextFormField(
        controller: _controller3,
        hint: 'Phone number',
        keyboardType: TextInputType.number,
      ),
    );
  }
}
