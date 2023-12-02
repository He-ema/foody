import 'package:flutter/material.dart';

import '../../../../../constants.dart';
import '../../../../../core/common/widgets/custom_text_form_field.dart';

class EmailField extends StatelessWidget {
  const EmailField({
    super.key,
    required TextEditingController controller2,
  }) : _controller2 = controller2;

  final TextEditingController _controller2;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: CustomTextFormField(
        hint: 'Email',
        controller: _controller2,
        icon: Icon(
          Icons.email,
          color: kPrimaryColor.withOpacity(0.5),
        ),
      ),
    );
  }
}
