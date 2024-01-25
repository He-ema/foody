import 'package:flutter/material.dart';
import 'package:foody/core/common/widgets/background_stack.dart';
import 'package:foody/features/chat/presentation/views/widgets/chatting_view_body.dart';

class ChattingView extends StatelessWidget {
  const ChattingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: BackgroundStack(
        body: ChattingViewBody(),
        isBig: false,
      ),
    );
  }
}
