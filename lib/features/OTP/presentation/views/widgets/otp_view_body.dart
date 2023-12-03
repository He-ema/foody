import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:email_otp/email_otp.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foody/constants.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/common/cubits/auth_cubit/auth_cubit.dart';
import '../../../../../core/common/custom_icon.dart';
import '../../../../../core/common/widgets/custom_button.dart';
import '../../../../../core/utils/app_router.dart';
import '../../../../../core/utils/styles.dart';
import 'otp_field.dart';

class OTPViewBody extends StatefulWidget {
  const OTPViewBody({super.key});

  @override
  State<OTPViewBody> createState() => _OTPViewBodyState();
}

class _OTPViewBodyState extends State<OTPViewBody> {
  final TextEditingController _controller = TextEditingController();
  final TextEditingController _controller2 = TextEditingController();
  final TextEditingController _controller3 = TextEditingController();
  final TextEditingController _controller4 = TextEditingController();
  EmailOTP myauth = EmailOTP();
  String OTPValue = '1234';
  bool isFalse = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    myauth.setConfig(
        appEmail: "Laza@gmail.com",
        appName: "Laza",
        userEmail: BlocProvider.of<AuthCubit>(context).email,
        otpLength: 4,
        otpType: OTPType.digitsOnly);
    myauth.sendOTP();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _controller.dispose();
    _controller2.dispose();
    _controller3.dispose();
    _controller4.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kHorizontalPadding),
      child: Column(
        children: [
          const SizedBox(
            height: 50,
          ),
          const Row(
            children: [
              CustomIcon(),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          const Row(
            children: [
              Text(
                'Enter 4-digit Verification code',
                style: Styles.textStyle25,
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          const Text(
            'Enter Code Sent to your Email address to complete registeration process',
            style: Styles.textStyle15,
          ),
          const Spacer(
            flex: 1,
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              OTPField(
                controller: _controller,
                isFalse: isFalse,
                onSaved: (p0) {},
                onChanged: (value) async {
                  if (value.length == 1) {
                    OTPValue = OTPValue.replaceRange(0, 1, value);
                    FocusScope.of(context).nextFocus();
                    await verify();
                  }
                },
              ),
              OTPField(
                controller: _controller2,
                isFalse: isFalse,
                onSaved: (p0) {},
                onChanged: (value) async {
                  if (value.length == 1) {
                    OTPValue = OTPValue.replaceRange(1, 2, value);
                    FocusScope.of(context).nextFocus();
                    await verify();
                  }
                },
              ),
              OTPField(
                controller: _controller3,
                isFalse: isFalse,
                onSaved: (p0) {},
                onChanged: (value) async {
                  if (value.length == 1) {
                    OTPValue = OTPValue.replaceRange(2, 3, value);
                    FocusScope.of(context).nextFocus();
                    await verify();
                  }
                },
              ),
              OTPField(
                controller: _controller4,
                isFalse: isFalse,
                onSaved: (p0) {},
                onChanged: (value) async {
                  if (value.length == 1) {
                    OTPValue = OTPValue.replaceRange(3, 4, value);
                    FocusScope.of(context).nextFocus();
                    await verify();
                  }
                },
              ),
            ],
          ),
          const Spacer(
            flex: 3,
          ),
          Center(
            child: Container(
              width: MediaQuery.of(context).size.width * 0.35,
              height: 55,
              child: CustomButton(
                text: 'Resend code ',
                onPressed: () async {
                  await myauth.sendOTP();
                },
              ),
            ),
          ),
          const SizedBox(
            height: 30,
          ),
        ],
      ),
    );
  }

  Future<void> verify() async {
    if (_controller.text != '' &&
        _controller2.text != '' &&
        _controller3.text != '' &&
        _controller4.text != '') {
      if (await myauth.verifyOTP(otp: OTPValue) == true) {
        final CollectionReference users =
            FirebaseFirestore.instance.collection(kUsersCollectionReference);
        users.doc(BlocProvider.of<AuthCubit>(context).email).update({
          kVerified: true,
        });
        GoRouter.of(context).push(AppRouter.infoRoute);
      } else {
        _controller.clear();
        _controller2.clear();
        _controller3.clear();
        _controller4.clear();
        isFalse = true;
        setState(() {});
      }
    }
  }
}
