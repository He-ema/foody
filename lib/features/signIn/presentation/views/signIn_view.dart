import 'package:flutter/material.dart';
import 'package:foody/features/signIn/presentation/views/widgets/signIn_view_body.dart';

import '../../../../core/common/widgets/background_stack.dart';

class SignInView extends StatelessWidget {
  const SignInView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: const BackgroundStack(
        body: SignInViewBody(),
        isBig: false,
      ),
    );
  }
}
