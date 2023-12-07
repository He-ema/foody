import 'package:flutter/material.dart';
import 'package:foody/core/common/widgets/background_stack.dart';
import 'package:foody/features/profile/presentation/views/widgets/profile_view_body.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key, required this.email});
  final String email;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: BackgroundStack(
          body: ProfileViewBody(
        email: email,
      )),
    );
  }
}
