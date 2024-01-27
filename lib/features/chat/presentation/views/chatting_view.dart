import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foody/core/common/widgets/background_stack.dart';
import 'package:foody/features/chat/presentation/managers/chat_cubit/chat_cubit.dart';
import 'package:foody/features/chat/presentation/views/widgets/chatting_view_body.dart';
import 'package:foody/features/profile/data/models/user_model.dart';

class ChattingView extends StatelessWidget {
  const ChattingView({super.key, required this.user});
  final UserModel user;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: BackgroundStack(
        body: ChattingViewBody(user: user),
        isBig: false,
      ),
    );
  }
}
