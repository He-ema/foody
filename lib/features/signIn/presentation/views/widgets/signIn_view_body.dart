import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:foody/core/common/cubits/auth_cubit/auth_cubit.dart';
import 'package:foody/core/common/functions/show_awesome_dialouge.dart';
import 'package:foody/features/signIn/presentation/views/widgets/password_field.dart';
import 'package:foody/features/signIn/presentation/views/widgets/username_field.dart';
import 'package:go_router/go_router.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import '../../../../../constants.dart';
import '../../../../../core/common/widgets/custom_button.dart';
import '../../../../../core/common/widgets/outSide_registeration.dart';
import '../../../../../core/utils/app_router.dart';
import '../../../../../core/utils/asset_data.dart';
import '../../../../../core/utils/styles.dart';
import 'email_field.dart';

class SignInViewBody extends StatefulWidget {
  const SignInViewBody({super.key});

  @override
  State<SignInViewBody> createState() => _SignInViewBodyState();
}

class _SignInViewBodyState extends State<SignInViewBody> {
  final GlobalKey<FormState> formKey = GlobalKey();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  final TextEditingController _controller = TextEditingController();
  final TextEditingController _controller2 = TextEditingController();
  final TextEditingController _controller3 = TextEditingController();
  bool isLoading = false;

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _controller.dispose();
    _controller2.dispose();
    _controller3.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is AuthLoading) {
          isLoading = true;
          setState(() {});
        } else if (state is AuthSuccess) {
          isLoading = false;
          setState(() {});
          if (BlocProvider.of<AuthCubit>(context).signedWithGoogle) {
            GoRouter.of(context).push(AppRouter.infoRoute);
          } else {
            GoRouter.of(context).push(AppRouter.otpRoute);
          }
        } else if (state is AuthFailure) {
          isLoading = false;
          setState(() {});
          showAwesomeDialouge(
              context: context,
              header: state.erroHeader,
              description: state.errorMessage,
              dialogType: DialogType.error);
        }
      },
      child: ModalProgressHUD(
        inAsyncCall: isLoading,
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: kHorizontalPadding),
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
                              'Sign Up for Free',
                              style: Styles.textStyle20,
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        UsernameField(controller: _controller),
                        const SizedBox(
                          height: 12,
                        ),
                        EmailField(controller2: _controller2),
                        const SizedBox(
                          height: 12,
                        ),
                        PasswordField(controller3: _controller3),
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
                                onPressed: () async {
                                  await BlocProvider.of<AuthCubit>(context)
                                      .signInWithGoogle();
                                },
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
                          height: 15,
                        ),
                        GestureDetector(
                          onTap: () {
                            GoRouter.of(context)
                                .pushReplacement(AppRouter.logInRoute);
                          },
                          child: Text('Already have an account ?',
                              style: Styles.textStyle15
                                  .copyWith(color: kPrimaryColor)),
                        ),
                        const SizedBox(
                          height: 15,
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
                        text: 'Sign in',
                        onPressed: () {
                          if (formKey.currentState!.validate()) {
                            BlocProvider.of<AuthCubit>(context).signUpwithEmail(
                                email: _controller2.text,
                                password: _controller3.text,
                                name: _controller.text);
                          } else {
                            autovalidateMode = AutovalidateMode.always;
                            setState(() {});
                          }
                        },
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
