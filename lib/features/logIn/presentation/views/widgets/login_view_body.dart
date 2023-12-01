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

class LoginViewBody extends StatelessWidget {
  const LoginViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: kHorizontalPadding),
            child: SingleChildScrollView(
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

                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: CustomTextFormField(
                      hint: 'Email',
                      icon: Icon(
                        Icons.email,
                        color: kPrimaryColor.withOpacity(0.5),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: CustomTextFormField(
                      isPassword: true,
                      hint: 'Password',
                      icon: Icon(
                        Icons.lock,
                        color: kPrimaryColor.withOpacity(0.5),
                      ),
                    ),
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
                    child: const Text('doesn\'t have an account ?'),
                  ),
                  const SizedBox(
                    height: 45,
                  ),
                ],
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
                    onPressed: () {},
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
