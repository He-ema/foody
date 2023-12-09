import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foody/features/profile/presentation/manager/profile_cubit/profile_cubit.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import '../../../../../constants.dart';
import '../../../../../core/common/widgets/custom_button.dart';
import '../../../../../core/common/widgets/custom_text_form_field.dart';
import 'image_area.dart';

class ProfileSuccessBody extends StatefulWidget {
  const ProfileSuccessBody({
    super.key,
    required this.state,
  });
  final ProfileSuccess state;

  @override
  State<ProfileSuccessBody> createState() => _ProfileSuccessBodyState();
}

class _ProfileSuccessBodyState extends State<ProfileSuccessBody>
    with SingleTickerProviderStateMixin {
  final TextEditingController _controller = TextEditingController();

  final TextEditingController _controller2 = TextEditingController();

  final TextEditingController _controller3 = TextEditingController();

  final TextEditingController _controller4 = TextEditingController();

  late AnimationController animationController;
  late Animation<Offset> slidingAnimation;

  bool isLoading = false;
  bool isVisible = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller.text = widget.state.user.firstName;
    _controller2.text = widget.state.user.secondName;
    _controller3.text = widget.state.user.email;
    _controller4.text = widget.state.user.phone;
    initSlidingAnimation();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _controller.dispose();
    _controller2.dispose();
    _controller3.dispose();
    _controller4.dispose();
    animationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: isLoading,
      child: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          SliverToBoxAdapter(
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: kHorizontalPadding),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.15,
                  ),
                  AnimatedBuilder(
                    animation: slidingAnimation,
                    builder: (context, child) => SlideTransition(
                        position: slidingAnimation,
                        child: ImageArea(widget: widget)),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      AnimatedBuilder(
                        animation: slidingAnimation,
                        builder: (context, child) => SlideTransition(
                          position: slidingAnimation,
                          child: SizedBox(
                            width: MediaQuery.of(context).size.width * 0.4,
                            child: CustomTextFormField(
                              hint: 'First name',
                              controller: _controller,
                              onChanged: onFieldDataChanged,
                            ),
                          ),
                        ),
                      ),
                      AnimatedBuilder(
                        animation: slidingAnimation,
                        builder: (context, child) => SlideTransition(
                          position: slidingAnimation,
                          child: SizedBox(
                            width: MediaQuery.of(context).size.width * 0.4,
                            child: CustomTextFormField(
                              hint: 'Second name',
                              controller: _controller2,
                              onChanged: onFieldDataChanged,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: AnimatedBuilder(
                      animation: slidingAnimation,
                      builder: (context, child) => SlideTransition(
                        position: slidingAnimation,
                        child: CustomTextFormField(
                          hint: 'Email',
                          enabled: false,
                          controller: _controller3,
                          onChanged: onFieldDataChanged,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: AnimatedBuilder(
                      animation: slidingAnimation,
                      builder: (context, child) => SlideTransition(
                        position: slidingAnimation,
                        child: CustomTextFormField(
                          hint: 'Password',
                          controller: _controller4,
                          onChanged: onFieldDataChanged,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SliverFillRemaining(
            hasScrollBody: false,
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 30),
                child: Center(
                    child: AnimatedBuilder(
                  animation: slidingAnimation,
                  builder: (context, child) => SlideTransition(
                    position: slidingAnimation,
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.35,
                      height: 55,
                      child: CustomButton(
                        enabled: isVisible,
                        text: 'Save',
                        onPressed: onButtonPressed,
                      ),
                    ),
                  ),
                )),
              ),
            ),
          ),
        ],
      ),
    );
  }

  onFieldDataChanged(value) {
    isVisible = true;
    setState(() {});
  }

  void onButtonPressed() async {
    isLoading = true;
    setState(() {});
    await UpdateData(
        email: widget.state.user.email,
        firstName: _controller.text,
        secondName: _controller2.text,
        phone: _controller4.text);
    isLoading = false;
    if (mounted) {
      setState(() {});
    }
  }

  Future<void> UpdateData({
    required String email,
    required String firstName,
    required String secondName,
    required String phone,
  }) async {
    CollectionReference _users =
        FirebaseFirestore.instance.collection(kUsersCollectionReference);
    await _users.doc(email).update({
      kFname: firstName,
      kSname: secondName,
      kPhone: phone,
    });
    await BlocProvider.of<ProfileCubit>(context).getUserData(email);
  }

  void initSlidingAnimation() {
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 800),
    );

    slidingAnimation = Tween<Offset>(
      begin: const Offset(0, 20),
      end: Offset.zero,
    ).animate(animationController);
    animationController.forward();
  }
}
