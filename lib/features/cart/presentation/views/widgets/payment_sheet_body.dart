import 'package:flutter/material.dart';
import 'package:foody/constants.dart';
import 'package:foody/core/common/widgets/custom_button.dart';
import 'package:foody/core/utils/styles.dart';

class PaymentSheetBody extends StatelessWidget {
  const PaymentSheetBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: MediaQuery.of(context).size.width * 0.1,
                height: 5,
                decoration: BoxDecoration(
                  color: kPrimaryColor,
                  borderRadius: BorderRadius.circular(20),
                ),
              )
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          const Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                'Add your payment information',
                style: Styles.textStyle22,
              ),
            ],
          ),
          const SizedBox(
            height: 15,
          ),
          const PaymentTextField(
            label: 'Card number',
            autoFocus: true,
          ),
          const SizedBox(
            height: 15,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                child: const PaymentTextField(
                  label: 'MM/YY',
                ),
                width: (MediaQuery.of(context).size.width * 0.5) - 20,
              ),
              Container(
                child: const PaymentTextField(
                  label: 'CVC',
                ),
                width: (MediaQuery.of(context).size.width * 0.5) - 20,
              ),
            ],
          ),
          const SizedBox(
            height: 40,
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            child: CustomButton(
              text: 'Pay',
              onPressed: () {},
            ),
          ),
          SizedBox(
            height: 40 + MediaQuery.of(context).viewInsets.bottom,
          ),
        ],
      ),
    );
  }
}

class PaymentTextField extends StatelessWidget {
  const PaymentTextField(
      {super.key, this.autoFocus = false, required this.label});
  final bool autoFocus;
  final String label;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      cursorColor: kPrimaryColor,
      autofocus: autoFocus,
      decoration: InputDecoration(
        labelText: label,
        labelStyle: TextStyle(fontWeight: FontWeight.bold),
        floatingLabelStyle: TextStyle(color: kPrimaryColor),
        enabledBorder: createBorder(),
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
