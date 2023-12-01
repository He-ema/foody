import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:foody/constants.dart';
import 'package:foody/core/common/widgets/custom_button.dart';
import 'package:foody/core/common/widgets/custom_text_form_field.dart';
import 'package:foody/core/common/widgets/outSide_registeration.dart';
import 'package:foody/core/utils/asset_data.dart';
import 'package:foody/core/utils/styles.dart';

class SignInViewBody extends StatelessWidget {
  const SignInViewBody({super.key});

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
                        'Sign Up for Free',
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
                      hint: 'username',
                      icon: Icon(
                        Icons.person,
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
                  SizedBox(
                    height: 30,
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
                    text: 'Sign in',
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
