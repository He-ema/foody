import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foody/constants.dart';
import 'package:foody/core/common/cubits/auth_cubit/auth_cubit.dart';
import 'package:foody/core/utils/styles.dart';
import 'package:foody/features/info/presentation/views/widgets/phone_field.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import '../../../../../core/common/custom_icon.dart';
import '../../../../../core/common/widgets/custom_button.dart';
import '../../../../../core/common/widgets/custom_text_form_field.dart';
import 'first_name_field.dart';
import 'last_name_field.dart';

class InfoViewBody extends StatefulWidget {
  const InfoViewBody({super.key});

  @override
  State<InfoViewBody> createState() => _InfoViewBodyState();
}

class _InfoViewBodyState extends State<InfoViewBody> {
  final GlobalKey<FormState> formKey = GlobalKey();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  final TextEditingController _controller = TextEditingController();
  final TextEditingController _controller2 = TextEditingController();
  final TextEditingController _controller3 = TextEditingController();
  bool isLoading = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if (BlocProvider.of<AuthCubit>(context).signedWithGoogle) {
      List<String> names = BlocProvider.of<AuthCubit>(context).name!.split(' ');
      _controller.text = names[0];
      _controller2.text = names[1];
    }
  }

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
    return ModalProgressHUD(
      inAsyncCall: isLoading,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: kHorizontalPadding),
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: SingleChildScrollView(
                child: Form(
                  key: formKey,
                  autovalidateMode: autovalidateMode,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
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
                            'Fill in your bio to get started',
                            style: Styles.textStyle25,
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const Text(
                        'This data will be displayed in your account profile for security',
                        style: Styles.textStyle15,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      FirstNameField(controller: _controller),
                      const SizedBox(
                        height: 20,
                      ),
                      LastNameField(controller2: _controller2),
                      const SizedBox(
                        height: 20,
                      ),
                      PhoneField(controller3: _controller3),
                      const SizedBox(
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
                child: Container(
                  margin: const EdgeInsets.only(bottom: 30),
                  width: MediaQuery.of(context).size.width * 0.35,
                  height: 55,
                  child: CustomButton(
                    text: 'Continue',
                    onPressed: () async {
                      if (formKey.currentState!.validate()) {
                        isLoading = true;
                        setState(() {});
                        await BlocProvider.of<AuthCubit>(context).addExtraData(
                            firstName: _controller.text,
                            secondName: _controller2.text,
                            phone: _controller3.text);
                        isLoading = false;
                        setState(() {});
                        //Navigate to success view
                      } else {
                        autovalidateMode = AutovalidateMode.always;
                      }
                    },
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
