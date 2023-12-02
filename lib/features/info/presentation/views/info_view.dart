import 'package:flutter/material.dart';
import 'package:foody/core/common/widgets/background_stack.dart';
import 'package:foody/features/info/presentation/views/widgets/info_view_body.dart';

class InfoView extends StatelessWidget {
  const InfoView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: const BackgroundStack(
        body: InfoViewBody(),
        isBig: false,
      ),
    );
  }
}
