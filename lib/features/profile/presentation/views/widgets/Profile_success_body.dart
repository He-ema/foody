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

class _ProfileSuccessBodyState extends State<ProfileSuccessBody> {
  final TextEditingController _controller = TextEditingController();

  final TextEditingController _controller2 = TextEditingController();

  final TextEditingController _controller3 = TextEditingController();

  final TextEditingController _controller4 = TextEditingController();

  bool isLoading = false;
  bool isVisible = false;
  bool success = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller.text = widget.state.user.firstName;
    _controller2.text = widget.state.user.secondName;
    _controller3.text = widget.state.user.email;
    _controller4.text = widget.state.user.phone;
    Future.delayed(
      Duration(milliseconds: 1),
      () {
        setState(() {
          success = true;
        });
      },
    );
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
    return AnimatedOpacity(
      duration: const Duration(seconds: 1),
      opacity: success ? 1 : 0,
      child: ModalProgressHUD(
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
                    ImageArea(widget: widget),
                    const SizedBox(
                      height: 30,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.4,
                          child: CustomTextFormField(
                            hint: 'First name',
                            controller: _controller,
                            onChanged: onFieldDataChanged,
                          ),
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.4,
                          child: CustomTextFormField(
                            hint: 'Second name',
                            controller: _controller2,
                            onChanged: onFieldDataChanged,
                          ),
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
                        enabled: false,
                        controller: _controller3,
                        onChanged: onFieldDataChanged,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width,
                      child: CustomTextFormField(
                        hint: 'Password',
                        controller: _controller4,
                        onChanged: onFieldDataChanged,
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
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  onFieldDataChanged(value) {
    isVisible = true;
    if (mounted) {
      setState(() {});
    }
  }

  void onButtonPressed() async {
    isLoading = true;
    if (mounted) {
      setState(() {});
    }
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
}
