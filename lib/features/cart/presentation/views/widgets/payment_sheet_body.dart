import 'package:flutter/material.dart';
import 'package:foody/constants.dart';
import 'package:foody/core/common/widgets/custom_button.dart';
import 'package:foody/core/utils/styles.dart';
import 'package:foody/features/cart/presentation/views/widgets/payment_text_field.dart';

class PaymentSheetBody extends StatefulWidget {
  const PaymentSheetBody({super.key});

  @override
  State<PaymentSheetBody> createState() => _PaymentSheetBodyState();
}

class _PaymentSheetBodyState extends State<PaymentSheetBody> {
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  final GlobalKey<FormState> _formKey = GlobalKey();
  Color color = kPrimaryColor;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15),
      child: Form(
        key: _formKey,
        autovalidateMode: autovalidateMode,
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
                SizedBox(
                  width: (MediaQuery.of(context).size.width * 0.5) - 20,
                  child: const PaymentTextField(
                    label: 'MM/YY',
                  ),
                ),
                SizedBox(
                  width: (MediaQuery.of(context).size.width * 0.5) - 20,
                  child: const PaymentTextField(
                    label: 'CVC',
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 40,
            ),
            GestureDetector(
              onTap: () {
                if (_formKey.currentState!.validate()) {
                  color = Colors.green;
                  setState(() {});
                  Future.delayed(Duration(seconds: 2), () {
                    Navigator.pop(context);
                  });
                } else {
                  autovalidateMode = AutovalidateMode.always;
                  setState(() {});
                }
              },
              child: AnimatedContainer(
                decoration: BoxDecoration(
                  color: color,
                  borderRadius: BorderRadius.circular(15),
                ),
                duration: const Duration(seconds: 1),
                width: MediaQuery.of(context).size.width,
                height: 55,
                child: Center(
                  child: Text(
                    color == kPrimaryColor ? 'Pay' : 'success',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 23,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 40 + MediaQuery.of(context).viewInsets.bottom,
            ),
          ],
        ),
      ),
    );
  }
}
