import 'package:flutter/material.dart';

import '../../../../../core/common/widgets/custom_text_form_field.dart';

class LastNameField extends StatelessWidget {
  const LastNameField({
    super.key,
    required TextEditingController controller2,
  }) : _controller2 = controller2;

  final TextEditingController _controller2;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: CustomTextFormField(
        controller: _controller2,
        hint: 'Last Name',
      ),
    );
  }
}
