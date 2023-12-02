import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

import '../../../../../constants.dart';
import '../../../../../core/common/widgets/custom_button.dart';
import '../../../../../core/common/widgets/custom_text_form_field.dart';
import '../../../../../core/common/widgets/outSide_registeration.dart';
import '../../../../../core/utils/app_router.dart';
import '../../../../../core/utils/asset_data.dart';
import '../../../../../core/utils/styles.dart';
import 'login_email_field.dart';
import 'login_password_field.dart';

class LoginViewBody extends StatefulWidget {
  const LoginViewBody({super.key});

  @override
  State<LoginViewBody> createState() => _LoginViewBodyState();
}

class _LoginViewBodyState extends State<LoginViewBody> {
  final GlobalKey<FormState> formKey = GlobalKey();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  final TextEditingController _controller = TextEditingController();
  final TextEditingController _controller2 = TextEditingController();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _controller.dispose();
    _controller2.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: kHorizontalPadding),
            child: SingleChildScrollView(
              child: Form(
                key: formKey,
                autovalidateMode: autovalidateMode,
                child: Column(
                  children: [
                    const SizedBox(
                      height: 50,
                    ),
                    Image.asset(
                      AssetData.logo,
                      width: MediaQuery.of(context).size.width * 0.35,
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    SvgPicture.asset(
                      AssetData.appName,
                      width: MediaQuery.of(context).size.width * 0.35,
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Login to Your Account',
                          style: Styles.textStyle20,
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),

                    LoginEmailField(controller: _controller),
                    const SizedBox(
                      height: 12,
                    ),
                    LoginPasswordField(
                      controller: _controller2,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Or Continue with',
                          style: Styles.textStyle15,
                        ),
                      ],
                    ),
                    // ignore: prefer_const_constructors
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          height: 50,
                          child: OutsideRegisteration(
                            name: '  Google  ',
                            image: AssetData.google,
                            onPressed: () {},
                          ),
                        ),
                        SizedBox(
                          height: 50,
                          child: OutsideRegisteration(
                            name: 'Facebook',
                            image: AssetData.facebook,
                            onPressed: () {},
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 45,
                    ),
                    GestureDetector(
                      onTap: () {
                        GoRouter.of(context)
                            .pushReplacement(AppRouter.signInRoute);
                      },
                      child: Text(
                        'doesn\'t have an account ?',
                        style:
                            Styles.textStyle15.copyWith(color: kPrimaryColor),
                      ),
                    ),
                    const SizedBox(
                      height: 45,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        SliverFillRemaining(
          hasScrollBody: false,
          child: Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 30),
              child: Center(
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.35,
                  height: 55,
                  child: CustomButton(
                    text: 'Log in',
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                      } else {
                        autovalidateMode = AutovalidateMode.always;
                      }
                    },
                  ),
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}
