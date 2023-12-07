import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foody/constants.dart';
import 'package:foody/core/common/widgets/custom_text_form_field.dart';
import 'package:foody/core/utils/styles.dart';
import 'package:foody/features/profile/presentation/manager/profile_cubit/profile_cubit.dart';
import 'package:foody/features/profile/presentation/views/widgets/profile_loading_view.dart';

import 'Profile_success_body.dart';

class ProfileViewBody extends StatelessWidget {
  const ProfileViewBody({super.key, required this.email});
  final String email;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileCubit, ProfileState>(
      builder: (context, state) {
        if (state is ProfileSuccess) {
          return ProfileSuccessBody(
            state: state,
          );
        } else if (state is ProfileFailure) {
          return Center(
            child: Text(
              state.errorMessage,
              style: Styles.textStyle25,
            ),
          );
        } else {
          return ProfileLoadingView();
        }
      },
    );
  }
}
